; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39406 () Bool)

(assert start!39406)

(declare-fun b_free!9673 () Bool)

(declare-fun b_next!9673 () Bool)

(assert (=> start!39406 (= b_free!9673 (not b_next!9673))))

(declare-fun tp!34547 () Bool)

(declare-fun b_and!17221 () Bool)

(assert (=> start!39406 (= tp!34547 b_and!17221)))

(declare-fun res!244324 () Bool)

(declare-fun e!249838 () Bool)

(assert (=> start!39406 (=> (not res!244324) (not e!249838))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25499 0))(
  ( (array!25500 (arr!12199 (Array (_ BitVec 32) (_ BitVec 64))) (size!12551 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25499)

(assert (=> start!39406 (= res!244324 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12551 _keys!709))))))

(assert (=> start!39406 e!249838))

(declare-fun tp_is_empty!10825 () Bool)

(assert (=> start!39406 tp_is_empty!10825))

(assert (=> start!39406 tp!34547))

(assert (=> start!39406 true))

(declare-datatypes ((V!15539 0))(
  ( (V!15540 (val!5457 Int)) )
))
(declare-datatypes ((ValueCell!5069 0))(
  ( (ValueCellFull!5069 (v!7704 V!15539)) (EmptyCell!5069) )
))
(declare-datatypes ((array!25501 0))(
  ( (array!25502 (arr!12200 (Array (_ BitVec 32) ValueCell!5069)) (size!12552 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25501)

(declare-fun e!249841 () Bool)

(declare-fun array_inv!8896 (array!25501) Bool)

(assert (=> start!39406 (and (array_inv!8896 _values!549) e!249841)))

(declare-fun array_inv!8897 (array!25499) Bool)

(assert (=> start!39406 (array_inv!8897 _keys!709)))

(declare-fun b!419141 () Bool)

(declare-fun res!244325 () Bool)

(assert (=> b!419141 (=> (not res!244325) (not e!249838))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25499 (_ BitVec 32)) Bool)

(assert (=> b!419141 (= res!244325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419142 () Bool)

(declare-fun res!244322 () Bool)

(declare-fun e!249843 () Bool)

(assert (=> b!419142 (=> (not res!244322) (not e!249843))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419142 (= res!244322 (bvsle from!863 i!563))))

(declare-fun b!419143 () Bool)

(assert (=> b!419143 (= e!249838 e!249843)))

(declare-fun res!244317 () Bool)

(assert (=> b!419143 (=> (not res!244317) (not e!249843))))

(declare-fun lt!192178 () array!25499)

(assert (=> b!419143 (= res!244317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192178 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!419143 (= lt!192178 (array!25500 (store (arr!12199 _keys!709) i!563 k!794) (size!12551 _keys!709)))))

(declare-fun mapNonEmpty!17859 () Bool)

(declare-fun mapRes!17859 () Bool)

(declare-fun tp!34548 () Bool)

(declare-fun e!249835 () Bool)

(assert (=> mapNonEmpty!17859 (= mapRes!17859 (and tp!34548 e!249835))))

(declare-fun mapKey!17859 () (_ BitVec 32))

(declare-fun mapRest!17859 () (Array (_ BitVec 32) ValueCell!5069))

(declare-fun mapValue!17859 () ValueCell!5069)

(assert (=> mapNonEmpty!17859 (= (arr!12200 _values!549) (store mapRest!17859 mapKey!17859 mapValue!17859))))

(declare-fun e!249837 () Bool)

(declare-datatypes ((tuple2!7140 0))(
  ( (tuple2!7141 (_1!3581 (_ BitVec 64)) (_2!3581 V!15539)) )
))
(declare-datatypes ((List!7151 0))(
  ( (Nil!7148) (Cons!7147 (h!8003 tuple2!7140) (t!12489 List!7151)) )
))
(declare-datatypes ((ListLongMap!6053 0))(
  ( (ListLongMap!6054 (toList!3042 List!7151)) )
))
(declare-fun call!29198 () ListLongMap!6053)

(declare-fun call!29197 () ListLongMap!6053)

(declare-fun b!419144 () Bool)

(declare-fun v!412 () V!15539)

(declare-fun +!1240 (ListLongMap!6053 tuple2!7140) ListLongMap!6053)

(assert (=> b!419144 (= e!249837 (= call!29197 (+!1240 call!29198 (tuple2!7141 k!794 v!412))))))

(declare-fun mapIsEmpty!17859 () Bool)

(assert (=> mapIsEmpty!17859 mapRes!17859))

(declare-fun c!55223 () Bool)

(declare-fun minValue!515 () V!15539)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29194 () Bool)

(declare-fun zeroValue!515 () V!15539)

(declare-fun lt!192180 () array!25501)

(declare-fun getCurrentListMapNoExtraKeys!1247 (array!25499 array!25501 (_ BitVec 32) (_ BitVec 32) V!15539 V!15539 (_ BitVec 32) Int) ListLongMap!6053)

(assert (=> bm!29194 (= call!29198 (getCurrentListMapNoExtraKeys!1247 (ite c!55223 _keys!709 lt!192178) (ite c!55223 _values!549 lt!192180) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419145 () Bool)

(declare-fun e!249840 () Bool)

(declare-fun e!249836 () Bool)

(assert (=> b!419145 (= e!249840 (not e!249836))))

(declare-fun res!244321 () Bool)

(assert (=> b!419145 (=> res!244321 e!249836)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419145 (= res!244321 (validKeyInArray!0 (select (arr!12199 _keys!709) from!863)))))

(assert (=> b!419145 e!249837))

(assert (=> b!419145 (= c!55223 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12386 0))(
  ( (Unit!12387) )
))
(declare-fun lt!192187 () Unit!12386)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!444 (array!25499 array!25501 (_ BitVec 32) (_ BitVec 32) V!15539 V!15539 (_ BitVec 32) (_ BitVec 64) V!15539 (_ BitVec 32) Int) Unit!12386)

(assert (=> b!419145 (= lt!192187 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!444 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29195 () Bool)

(assert (=> bm!29195 (= call!29197 (getCurrentListMapNoExtraKeys!1247 (ite c!55223 lt!192178 _keys!709) (ite c!55223 lt!192180 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419146 () Bool)

(declare-fun res!244316 () Bool)

(assert (=> b!419146 (=> (not res!244316) (not e!249838))))

(assert (=> b!419146 (= res!244316 (validKeyInArray!0 k!794))))

(declare-fun b!419147 () Bool)

(declare-fun res!244329 () Bool)

(assert (=> b!419147 (=> (not res!244329) (not e!249838))))

(declare-fun arrayContainsKey!0 (array!25499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419147 (= res!244329 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!419148 () Bool)

(declare-fun e!249839 () Bool)

(assert (=> b!419148 (= e!249839 tp_is_empty!10825)))

(declare-fun b!419149 () Bool)

(declare-fun res!244326 () Bool)

(assert (=> b!419149 (=> (not res!244326) (not e!249838))))

(assert (=> b!419149 (= res!244326 (or (= (select (arr!12199 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12199 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419150 () Bool)

(assert (=> b!419150 (= e!249843 e!249840)))

(declare-fun res!244328 () Bool)

(assert (=> b!419150 (=> (not res!244328) (not e!249840))))

(assert (=> b!419150 (= res!244328 (= from!863 i!563))))

(declare-fun lt!192182 () ListLongMap!6053)

(assert (=> b!419150 (= lt!192182 (getCurrentListMapNoExtraKeys!1247 lt!192178 lt!192180 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419150 (= lt!192180 (array!25502 (store (arr!12200 _values!549) i!563 (ValueCellFull!5069 v!412)) (size!12552 _values!549)))))

(declare-fun lt!192188 () ListLongMap!6053)

(assert (=> b!419150 (= lt!192188 (getCurrentListMapNoExtraKeys!1247 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419151 () Bool)

(assert (=> b!419151 (= e!249836 true)))

(declare-fun lt!192183 () ListLongMap!6053)

(declare-fun lt!192179 () V!15539)

(declare-fun lt!192181 () tuple2!7140)

(assert (=> b!419151 (= (+!1240 lt!192183 lt!192181) (+!1240 (+!1240 lt!192183 (tuple2!7141 k!794 lt!192179)) lt!192181))))

(declare-fun lt!192186 () V!15539)

(assert (=> b!419151 (= lt!192181 (tuple2!7141 k!794 lt!192186))))

(declare-fun lt!192184 () Unit!12386)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!39 (ListLongMap!6053 (_ BitVec 64) V!15539 V!15539) Unit!12386)

(assert (=> b!419151 (= lt!192184 (addSameAsAddTwiceSameKeyDiffValues!39 lt!192183 k!794 lt!192179 lt!192186))))

(declare-fun lt!192185 () V!15539)

(declare-fun get!6049 (ValueCell!5069 V!15539) V!15539)

(assert (=> b!419151 (= lt!192179 (get!6049 (select (arr!12200 _values!549) from!863) lt!192185))))

(assert (=> b!419151 (= lt!192182 (+!1240 lt!192183 (tuple2!7141 (select (arr!12199 lt!192178) from!863) lt!192186)))))

(assert (=> b!419151 (= lt!192186 (get!6049 (select (store (arr!12200 _values!549) i!563 (ValueCellFull!5069 v!412)) from!863) lt!192185))))

(declare-fun dynLambda!710 (Int (_ BitVec 64)) V!15539)

(assert (=> b!419151 (= lt!192185 (dynLambda!710 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419151 (= lt!192183 (getCurrentListMapNoExtraKeys!1247 lt!192178 lt!192180 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419152 () Bool)

(declare-fun res!244323 () Bool)

(assert (=> b!419152 (=> (not res!244323) (not e!249838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419152 (= res!244323 (validMask!0 mask!1025))))

(declare-fun b!419153 () Bool)

(assert (=> b!419153 (= e!249841 (and e!249839 mapRes!17859))))

(declare-fun condMapEmpty!17859 () Bool)

(declare-fun mapDefault!17859 () ValueCell!5069)

