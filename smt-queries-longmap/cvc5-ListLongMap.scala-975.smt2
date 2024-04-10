; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21088 () Bool)

(assert start!21088)

(declare-fun b_free!5599 () Bool)

(declare-fun b_next!5599 () Bool)

(assert (=> start!21088 (= b_free!5599 (not b_next!5599))))

(declare-fun tp!19859 () Bool)

(declare-fun b_and!12429 () Bool)

(assert (=> start!21088 (= tp!19859 b_and!12429)))

(declare-fun b!212197 () Bool)

(declare-fun res!103736 () Bool)

(declare-fun e!138078 () Bool)

(assert (=> b!212197 (=> (not res!103736) (not e!138078))))

(declare-datatypes ((array!10125 0))(
  ( (array!10126 (arr!4806 (Array (_ BitVec 32) (_ BitVec 64))) (size!5131 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10125)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10125 (_ BitVec 32)) Bool)

(assert (=> b!212197 (= res!103736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212198 () Bool)

(declare-fun e!138083 () Bool)

(declare-fun tp_is_empty!5461 () Bool)

(assert (=> b!212198 (= e!138083 tp_is_empty!5461)))

(declare-fun b!212199 () Bool)

(declare-fun res!103737 () Bool)

(assert (=> b!212199 (=> (not res!103737) (not e!138078))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6929 0))(
  ( (V!6930 (val!2775 Int)) )
))
(declare-datatypes ((ValueCell!2387 0))(
  ( (ValueCellFull!2387 (v!4773 V!6929)) (EmptyCell!2387) )
))
(declare-datatypes ((array!10127 0))(
  ( (array!10128 (arr!4807 (Array (_ BitVec 32) ValueCell!2387)) (size!5132 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10127)

(assert (=> b!212199 (= res!103737 (and (= (size!5132 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5131 _keys!825) (size!5132 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9281 () Bool)

(declare-fun mapRes!9281 () Bool)

(declare-fun tp!19858 () Bool)

(declare-fun e!138079 () Bool)

(assert (=> mapNonEmpty!9281 (= mapRes!9281 (and tp!19858 e!138079))))

(declare-fun mapRest!9281 () (Array (_ BitVec 32) ValueCell!2387))

(declare-fun mapKey!9281 () (_ BitVec 32))

(declare-fun mapValue!9281 () ValueCell!2387)

(assert (=> mapNonEmpty!9281 (= (arr!4807 _values!649) (store mapRest!9281 mapKey!9281 mapValue!9281))))

(declare-fun b!212200 () Bool)

(declare-fun res!103734 () Bool)

(assert (=> b!212200 (=> (not res!103734) (not e!138078))))

(declare-datatypes ((List!3089 0))(
  ( (Nil!3086) (Cons!3085 (h!3727 (_ BitVec 64)) (t!8034 List!3089)) )
))
(declare-fun arrayNoDuplicates!0 (array!10125 (_ BitVec 32) List!3089) Bool)

(assert (=> b!212200 (= res!103734 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3086))))

(declare-fun res!103735 () Bool)

(assert (=> start!21088 (=> (not res!103735) (not e!138078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21088 (= res!103735 (validMask!0 mask!1149))))

(assert (=> start!21088 e!138078))

(declare-fun e!138081 () Bool)

(declare-fun array_inv!3179 (array!10127) Bool)

(assert (=> start!21088 (and (array_inv!3179 _values!649) e!138081)))

(assert (=> start!21088 true))

(assert (=> start!21088 tp_is_empty!5461))

(declare-fun array_inv!3180 (array!10125) Bool)

(assert (=> start!21088 (array_inv!3180 _keys!825)))

(assert (=> start!21088 tp!19859))

(declare-fun mapIsEmpty!9281 () Bool)

(assert (=> mapIsEmpty!9281 mapRes!9281))

(declare-fun b!212201 () Bool)

(declare-fun e!138082 () Bool)

(assert (=> b!212201 (= e!138078 (not e!138082))))

(declare-fun res!103740 () Bool)

(assert (=> b!212201 (=> res!103740 e!138082)))

(assert (=> b!212201 (= res!103740 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4200 0))(
  ( (tuple2!4201 (_1!2111 (_ BitVec 64)) (_2!2111 V!6929)) )
))
(declare-datatypes ((List!3090 0))(
  ( (Nil!3087) (Cons!3086 (h!3728 tuple2!4200) (t!8035 List!3090)) )
))
(declare-datatypes ((ListLongMap!3113 0))(
  ( (ListLongMap!3114 (toList!1572 List!3090)) )
))
(declare-fun lt!109332 () ListLongMap!3113)

(declare-fun zeroValue!615 () V!6929)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6929)

(declare-fun getCurrentListMap!1105 (array!10125 array!10127 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) Int) ListLongMap!3113)

(assert (=> b!212201 (= lt!109332 (getCurrentListMap!1105 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109334 () ListLongMap!3113)

(declare-fun lt!109333 () array!10127)

(assert (=> b!212201 (= lt!109334 (getCurrentListMap!1105 _keys!825 lt!109333 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109331 () ListLongMap!3113)

(declare-fun lt!109330 () ListLongMap!3113)

(assert (=> b!212201 (and (= lt!109331 lt!109330) (= lt!109330 lt!109331))))

(declare-fun v!520 () V!6929)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!109335 () ListLongMap!3113)

(declare-fun +!575 (ListLongMap!3113 tuple2!4200) ListLongMap!3113)

(assert (=> b!212201 (= lt!109330 (+!575 lt!109335 (tuple2!4201 k!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6444 0))(
  ( (Unit!6445) )
))
(declare-fun lt!109329 () Unit!6444)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!222 (array!10125 array!10127 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) (_ BitVec 64) V!6929 (_ BitVec 32) Int) Unit!6444)

(assert (=> b!212201 (= lt!109329 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!222 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!507 (array!10125 array!10127 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) Int) ListLongMap!3113)

(assert (=> b!212201 (= lt!109331 (getCurrentListMapNoExtraKeys!507 _keys!825 lt!109333 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212201 (= lt!109333 (array!10128 (store (arr!4807 _values!649) i!601 (ValueCellFull!2387 v!520)) (size!5132 _values!649)))))

(assert (=> b!212201 (= lt!109335 (getCurrentListMapNoExtraKeys!507 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212202 () Bool)

(declare-fun res!103741 () Bool)

(assert (=> b!212202 (=> (not res!103741) (not e!138078))))

(assert (=> b!212202 (= res!103741 (= (select (arr!4806 _keys!825) i!601) k!843))))

(declare-fun b!212203 () Bool)

(declare-fun res!103738 () Bool)

(assert (=> b!212203 (=> (not res!103738) (not e!138078))))

(assert (=> b!212203 (= res!103738 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5131 _keys!825))))))

(declare-fun b!212204 () Bool)

(assert (=> b!212204 (= e!138082 (= lt!109334 (+!575 lt!109331 (tuple2!4201 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212205 () Bool)

(declare-fun res!103739 () Bool)

(assert (=> b!212205 (=> (not res!103739) (not e!138078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212205 (= res!103739 (validKeyInArray!0 k!843))))

(declare-fun b!212206 () Bool)

(assert (=> b!212206 (= e!138079 tp_is_empty!5461)))

(declare-fun b!212207 () Bool)

(assert (=> b!212207 (= e!138081 (and e!138083 mapRes!9281))))

(declare-fun condMapEmpty!9281 () Bool)

(declare-fun mapDefault!9281 () ValueCell!2387)

