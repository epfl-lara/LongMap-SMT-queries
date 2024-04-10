; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39928 () Bool)

(assert start!39928)

(declare-fun b_free!10195 () Bool)

(declare-fun b_next!10195 () Bool)

(assert (=> start!39928 (= b_free!10195 (not b_next!10195))))

(declare-fun tp!36113 () Bool)

(declare-fun b_and!18049 () Bool)

(assert (=> start!39928 (= tp!36113 b_and!18049)))

(declare-fun b!433246 () Bool)

(declare-fun e!256190 () Bool)

(declare-fun e!256187 () Bool)

(assert (=> b!433246 (= e!256190 e!256187)))

(declare-fun res!254964 () Bool)

(assert (=> b!433246 (=> (not res!254964) (not e!256187))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433246 (= res!254964 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16235 0))(
  ( (V!16236 (val!5718 Int)) )
))
(declare-fun minValue!515 () V!16235)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!26527 0))(
  ( (array!26528 (arr!12713 (Array (_ BitVec 32) (_ BitVec 64))) (size!13065 (_ BitVec 32))) )
))
(declare-fun lt!198892 () array!26527)

(declare-fun zeroValue!515 () V!16235)

(declare-datatypes ((tuple2!7554 0))(
  ( (tuple2!7555 (_1!3788 (_ BitVec 64)) (_2!3788 V!16235)) )
))
(declare-datatypes ((List!7563 0))(
  ( (Nil!7560) (Cons!7559 (h!8415 tuple2!7554) (t!13207 List!7563)) )
))
(declare-datatypes ((ListLongMap!6467 0))(
  ( (ListLongMap!6468 (toList!3249 List!7563)) )
))
(declare-fun lt!198905 () ListLongMap!6467)

(declare-datatypes ((ValueCell!5330 0))(
  ( (ValueCellFull!5330 (v!7965 V!16235)) (EmptyCell!5330) )
))
(declare-datatypes ((array!26529 0))(
  ( (array!26530 (arr!12714 (Array (_ BitVec 32) ValueCell!5330)) (size!13066 (_ BitVec 32))) )
))
(declare-fun lt!198904 () array!26529)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1445 (array!26527 array!26529 (_ BitVec 32) (_ BitVec 32) V!16235 V!16235 (_ BitVec 32) Int) ListLongMap!6467)

(assert (=> b!433246 (= lt!198905 (getCurrentListMapNoExtraKeys!1445 lt!198892 lt!198904 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26529)

(declare-fun v!412 () V!16235)

(assert (=> b!433246 (= lt!198904 (array!26530 (store (arr!12714 _values!549) i!563 (ValueCellFull!5330 v!412)) (size!13066 _values!549)))))

(declare-fun lt!198903 () ListLongMap!6467)

(declare-fun _keys!709 () array!26527)

(assert (=> b!433246 (= lt!198903 (getCurrentListMapNoExtraKeys!1445 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433247 () Bool)

(declare-fun e!256184 () Bool)

(assert (=> b!433247 (= e!256184 true)))

(declare-fun lt!198900 () ListLongMap!6467)

(declare-fun lt!198894 () tuple2!7554)

(declare-fun lt!198901 () tuple2!7554)

(declare-fun lt!198891 () ListLongMap!6467)

(declare-fun +!1397 (ListLongMap!6467 tuple2!7554) ListLongMap!6467)

(assert (=> b!433247 (= lt!198900 (+!1397 (+!1397 lt!198891 lt!198901) lt!198894))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!198898 () V!16235)

(declare-datatypes ((Unit!12816 0))(
  ( (Unit!12817) )
))
(declare-fun lt!198899 () Unit!12816)

(declare-fun addCommutativeForDiffKeys!386 (ListLongMap!6467 (_ BitVec 64) V!16235 (_ BitVec 64) V!16235) Unit!12816)

(assert (=> b!433247 (= lt!198899 (addCommutativeForDiffKeys!386 lt!198891 k!794 v!412 (select (arr!12713 _keys!709) from!863) lt!198898))))

(declare-fun b!433249 () Bool)

(declare-fun e!256185 () Bool)

(assert (=> b!433249 (= e!256185 e!256184)))

(declare-fun res!254969 () Bool)

(assert (=> b!433249 (=> res!254969 e!256184)))

(assert (=> b!433249 (= res!254969 (= k!794 (select (arr!12713 _keys!709) from!863)))))

(assert (=> b!433249 (not (= (select (arr!12713 _keys!709) from!863) k!794))))

(declare-fun lt!198893 () Unit!12816)

(declare-fun e!256182 () Unit!12816)

(assert (=> b!433249 (= lt!198893 e!256182)))

(declare-fun c!55628 () Bool)

(assert (=> b!433249 (= c!55628 (= (select (arr!12713 _keys!709) from!863) k!794))))

(assert (=> b!433249 (= lt!198905 lt!198900)))

(declare-fun lt!198896 () ListLongMap!6467)

(assert (=> b!433249 (= lt!198900 (+!1397 lt!198896 lt!198901))))

(assert (=> b!433249 (= lt!198901 (tuple2!7555 (select (arr!12713 _keys!709) from!863) lt!198898))))

(declare-fun get!6323 (ValueCell!5330 V!16235) V!16235)

(declare-fun dynLambda!810 (Int (_ BitVec 64)) V!16235)

(assert (=> b!433249 (= lt!198898 (get!6323 (select (arr!12714 _values!549) from!863) (dynLambda!810 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433250 () Bool)

(declare-fun res!254956 () Bool)

(assert (=> b!433250 (=> (not res!254956) (not e!256190))))

(assert (=> b!433250 (= res!254956 (bvsle from!863 i!563))))

(declare-fun b!433251 () Bool)

(declare-fun e!256186 () Bool)

(declare-fun tp_is_empty!11347 () Bool)

(assert (=> b!433251 (= e!256186 tp_is_empty!11347)))

(declare-fun b!433252 () Bool)

(declare-fun res!254968 () Bool)

(declare-fun e!256189 () Bool)

(assert (=> b!433252 (=> (not res!254968) (not e!256189))))

(assert (=> b!433252 (= res!254968 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13065 _keys!709))))))

(declare-fun b!433253 () Bool)

(declare-fun res!254958 () Bool)

(assert (=> b!433253 (=> (not res!254958) (not e!256189))))

(assert (=> b!433253 (= res!254958 (or (= (select (arr!12713 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12713 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18642 () Bool)

(declare-fun mapRes!18642 () Bool)

(declare-fun tp!36114 () Bool)

(declare-fun e!256188 () Bool)

(assert (=> mapNonEmpty!18642 (= mapRes!18642 (and tp!36114 e!256188))))

(declare-fun mapKey!18642 () (_ BitVec 32))

(declare-fun mapValue!18642 () ValueCell!5330)

(declare-fun mapRest!18642 () (Array (_ BitVec 32) ValueCell!5330))

(assert (=> mapNonEmpty!18642 (= (arr!12714 _values!549) (store mapRest!18642 mapKey!18642 mapValue!18642))))

(declare-fun b!433254 () Bool)

(declare-fun res!254970 () Bool)

(assert (=> b!433254 (=> (not res!254970) (not e!256189))))

(declare-datatypes ((List!7564 0))(
  ( (Nil!7561) (Cons!7560 (h!8416 (_ BitVec 64)) (t!13208 List!7564)) )
))
(declare-fun arrayNoDuplicates!0 (array!26527 (_ BitVec 32) List!7564) Bool)

(assert (=> b!433254 (= res!254970 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7561))))

(declare-fun b!433255 () Bool)

(declare-fun res!254965 () Bool)

(assert (=> b!433255 (=> (not res!254965) (not e!256190))))

(assert (=> b!433255 (= res!254965 (arrayNoDuplicates!0 lt!198892 #b00000000000000000000000000000000 Nil!7561))))

(declare-fun b!433256 () Bool)

(assert (=> b!433256 (= e!256188 tp_is_empty!11347)))

(declare-fun b!433257 () Bool)

(declare-fun res!254962 () Bool)

(assert (=> b!433257 (=> (not res!254962) (not e!256189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433257 (= res!254962 (validMask!0 mask!1025))))

(declare-fun res!254959 () Bool)

(assert (=> start!39928 (=> (not res!254959) (not e!256189))))

(assert (=> start!39928 (= res!254959 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13065 _keys!709))))))

(assert (=> start!39928 e!256189))

(assert (=> start!39928 tp_is_empty!11347))

(assert (=> start!39928 tp!36113))

(assert (=> start!39928 true))

(declare-fun e!256191 () Bool)

(declare-fun array_inv!9250 (array!26529) Bool)

(assert (=> start!39928 (and (array_inv!9250 _values!549) e!256191)))

(declare-fun array_inv!9251 (array!26527) Bool)

(assert (=> start!39928 (array_inv!9251 _keys!709)))

(declare-fun b!433248 () Bool)

(declare-fun Unit!12818 () Unit!12816)

(assert (=> b!433248 (= e!256182 Unit!12818)))

(declare-fun lt!198895 () Unit!12816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12816)

(assert (=> b!433248 (= lt!198895 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433248 false))

(declare-fun b!433258 () Bool)

(assert (=> b!433258 (= e!256189 e!256190)))

(declare-fun res!254957 () Bool)

(assert (=> b!433258 (=> (not res!254957) (not e!256190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26527 (_ BitVec 32)) Bool)

(assert (=> b!433258 (= res!254957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198892 mask!1025))))

(assert (=> b!433258 (= lt!198892 (array!26528 (store (arr!12713 _keys!709) i!563 k!794) (size!13065 _keys!709)))))

(declare-fun b!433259 () Bool)

(declare-fun res!254967 () Bool)

(assert (=> b!433259 (=> (not res!254967) (not e!256189))))

(assert (=> b!433259 (= res!254967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18642 () Bool)

(assert (=> mapIsEmpty!18642 mapRes!18642))

(declare-fun b!433260 () Bool)

(declare-fun Unit!12819 () Unit!12816)

(assert (=> b!433260 (= e!256182 Unit!12819)))

(declare-fun b!433261 () Bool)

(declare-fun res!254961 () Bool)

(assert (=> b!433261 (=> (not res!254961) (not e!256189))))

(assert (=> b!433261 (= res!254961 (and (= (size!13066 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13065 _keys!709) (size!13066 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433262 () Bool)

(declare-fun res!254960 () Bool)

(assert (=> b!433262 (=> (not res!254960) (not e!256189))))

(declare-fun arrayContainsKey!0 (array!26527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433262 (= res!254960 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433263 () Bool)

(assert (=> b!433263 (= e!256187 (not e!256185))))

(declare-fun res!254966 () Bool)

(assert (=> b!433263 (=> res!254966 e!256185)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433263 (= res!254966 (not (validKeyInArray!0 (select (arr!12713 _keys!709) from!863))))))

(declare-fun lt!198902 () ListLongMap!6467)

(assert (=> b!433263 (= lt!198902 lt!198896)))

(assert (=> b!433263 (= lt!198896 (+!1397 lt!198891 lt!198894))))

(assert (=> b!433263 (= lt!198902 (getCurrentListMapNoExtraKeys!1445 lt!198892 lt!198904 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433263 (= lt!198894 (tuple2!7555 k!794 v!412))))

(assert (=> b!433263 (= lt!198891 (getCurrentListMapNoExtraKeys!1445 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198897 () Unit!12816)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!578 (array!26527 array!26529 (_ BitVec 32) (_ BitVec 32) V!16235 V!16235 (_ BitVec 32) (_ BitVec 64) V!16235 (_ BitVec 32) Int) Unit!12816)

(assert (=> b!433263 (= lt!198897 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!578 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433264 () Bool)

(declare-fun res!254963 () Bool)

(assert (=> b!433264 (=> (not res!254963) (not e!256189))))

(assert (=> b!433264 (= res!254963 (validKeyInArray!0 k!794))))

(declare-fun b!433265 () Bool)

(assert (=> b!433265 (= e!256191 (and e!256186 mapRes!18642))))

(declare-fun condMapEmpty!18642 () Bool)

(declare-fun mapDefault!18642 () ValueCell!5330)

