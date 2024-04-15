; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20440 () Bool)

(assert start!20440)

(declare-fun b_free!5095 () Bool)

(declare-fun b_next!5095 () Bool)

(assert (=> start!20440 (= b_free!5095 (not b_next!5095))))

(declare-fun tp!18316 () Bool)

(declare-fun b_and!11815 () Bool)

(assert (=> start!20440 (= tp!18316 b_and!11815)))

(declare-fun b!202193 () Bool)

(declare-fun res!96838 () Bool)

(declare-fun e!132450 () Bool)

(assert (=> b!202193 (=> (not res!96838) (not e!132450))))

(declare-datatypes ((V!6249 0))(
  ( (V!6250 (val!2520 Int)) )
))
(declare-datatypes ((tuple2!3794 0))(
  ( (tuple2!3795 (_1!1908 (_ BitVec 64)) (_2!1908 V!6249)) )
))
(declare-datatypes ((List!2709 0))(
  ( (Nil!2706) (Cons!2705 (h!3347 tuple2!3794) (t!7631 List!2709)) )
))
(declare-datatypes ((ListLongMap!2697 0))(
  ( (ListLongMap!2698 (toList!1364 List!2709)) )
))
(declare-fun lt!101377 () ListLongMap!2697)

(declare-fun lt!101378 () tuple2!3794)

(declare-fun lt!101371 () ListLongMap!2697)

(declare-fun +!413 (ListLongMap!2697 tuple2!3794) ListLongMap!2697)

(assert (=> b!202193 (= res!96838 (= lt!101377 (+!413 lt!101371 lt!101378)))))

(declare-fun b!202194 () Bool)

(declare-fun res!96833 () Bool)

(declare-fun e!132445 () Bool)

(assert (=> b!202194 (=> (not res!96833) (not e!132445))))

(declare-datatypes ((array!9115 0))(
  ( (array!9116 (arr!4307 (Array (_ BitVec 32) (_ BitVec 64))) (size!4633 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9115)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9115 (_ BitVec 32)) Bool)

(assert (=> b!202194 (= res!96833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202195 () Bool)

(declare-fun res!96834 () Bool)

(assert (=> b!202195 (=> (not res!96834) (not e!132445))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2132 0))(
  ( (ValueCellFull!2132 (v!4484 V!6249)) (EmptyCell!2132) )
))
(declare-datatypes ((array!9117 0))(
  ( (array!9118 (arr!4308 (Array (_ BitVec 32) ValueCell!2132)) (size!4634 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9117)

(assert (=> b!202195 (= res!96834 (and (= (size!4634 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4633 _keys!825) (size!4634 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8495 () Bool)

(declare-fun mapRes!8495 () Bool)

(assert (=> mapIsEmpty!8495 mapRes!8495))

(declare-fun b!202196 () Bool)

(declare-fun res!96842 () Bool)

(assert (=> b!202196 (=> (not res!96842) (not e!132445))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202196 (= res!96842 (validKeyInArray!0 k0!843))))

(declare-fun b!202197 () Bool)

(declare-fun e!132446 () Bool)

(assert (=> b!202197 (= e!132445 (not e!132446))))

(declare-fun res!96837 () Bool)

(assert (=> b!202197 (=> res!96837 e!132446)))

(assert (=> b!202197 (= res!96837 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6249)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6249)

(declare-fun getCurrentListMap!920 (array!9115 array!9117 (_ BitVec 32) (_ BitVec 32) V!6249 V!6249 (_ BitVec 32) Int) ListLongMap!2697)

(assert (=> b!202197 (= lt!101377 (getCurrentListMap!920 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101375 () array!9117)

(declare-fun lt!101372 () ListLongMap!2697)

(assert (=> b!202197 (= lt!101372 (getCurrentListMap!920 _keys!825 lt!101375 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101376 () ListLongMap!2697)

(declare-fun lt!101374 () ListLongMap!2697)

(assert (=> b!202197 (and (= lt!101376 lt!101374) (= lt!101374 lt!101376))))

(declare-fun v!520 () V!6249)

(assert (=> b!202197 (= lt!101374 (+!413 lt!101371 (tuple2!3795 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6078 0))(
  ( (Unit!6079) )
))
(declare-fun lt!101373 () Unit!6078)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!79 (array!9115 array!9117 (_ BitVec 32) (_ BitVec 32) V!6249 V!6249 (_ BitVec 32) (_ BitVec 64) V!6249 (_ BitVec 32) Int) Unit!6078)

(assert (=> b!202197 (= lt!101373 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!79 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!330 (array!9115 array!9117 (_ BitVec 32) (_ BitVec 32) V!6249 V!6249 (_ BitVec 32) Int) ListLongMap!2697)

(assert (=> b!202197 (= lt!101376 (getCurrentListMapNoExtraKeys!330 _keys!825 lt!101375 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202197 (= lt!101375 (array!9118 (store (arr!4308 _values!649) i!601 (ValueCellFull!2132 v!520)) (size!4634 _values!649)))))

(assert (=> b!202197 (= lt!101371 (getCurrentListMapNoExtraKeys!330 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202198 () Bool)

(assert (=> b!202198 (= e!132446 true)))

(assert (=> b!202198 e!132450))

(declare-fun res!96841 () Bool)

(assert (=> b!202198 (=> (not res!96841) (not e!132450))))

(assert (=> b!202198 (= res!96841 (= lt!101372 (+!413 lt!101376 lt!101378)))))

(assert (=> b!202198 (= lt!101378 (tuple2!3795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202199 () Bool)

(assert (=> b!202199 (= e!132450 (= lt!101372 (+!413 lt!101374 lt!101378)))))

(declare-fun b!202201 () Bool)

(declare-fun e!132444 () Bool)

(declare-fun e!132448 () Bool)

(assert (=> b!202201 (= e!132444 (and e!132448 mapRes!8495))))

(declare-fun condMapEmpty!8495 () Bool)

(declare-fun mapDefault!8495 () ValueCell!2132)

(assert (=> b!202201 (= condMapEmpty!8495 (= (arr!4308 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2132)) mapDefault!8495)))))

(declare-fun b!202202 () Bool)

(declare-fun res!96835 () Bool)

(assert (=> b!202202 (=> (not res!96835) (not e!132445))))

(assert (=> b!202202 (= res!96835 (= (select (arr!4307 _keys!825) i!601) k0!843))))

(declare-fun b!202203 () Bool)

(declare-fun res!96839 () Bool)

(assert (=> b!202203 (=> (not res!96839) (not e!132445))))

(declare-datatypes ((List!2710 0))(
  ( (Nil!2707) (Cons!2706 (h!3348 (_ BitVec 64)) (t!7632 List!2710)) )
))
(declare-fun arrayNoDuplicates!0 (array!9115 (_ BitVec 32) List!2710) Bool)

(assert (=> b!202203 (= res!96839 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2707))))

(declare-fun b!202204 () Bool)

(declare-fun e!132449 () Bool)

(declare-fun tp_is_empty!4951 () Bool)

(assert (=> b!202204 (= e!132449 tp_is_empty!4951)))

(declare-fun mapNonEmpty!8495 () Bool)

(declare-fun tp!18317 () Bool)

(assert (=> mapNonEmpty!8495 (= mapRes!8495 (and tp!18317 e!132449))))

(declare-fun mapKey!8495 () (_ BitVec 32))

(declare-fun mapValue!8495 () ValueCell!2132)

(declare-fun mapRest!8495 () (Array (_ BitVec 32) ValueCell!2132))

(assert (=> mapNonEmpty!8495 (= (arr!4308 _values!649) (store mapRest!8495 mapKey!8495 mapValue!8495))))

(declare-fun b!202205 () Bool)

(assert (=> b!202205 (= e!132448 tp_is_empty!4951)))

(declare-fun res!96836 () Bool)

(assert (=> start!20440 (=> (not res!96836) (not e!132445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20440 (= res!96836 (validMask!0 mask!1149))))

(assert (=> start!20440 e!132445))

(declare-fun array_inv!2825 (array!9117) Bool)

(assert (=> start!20440 (and (array_inv!2825 _values!649) e!132444)))

(assert (=> start!20440 true))

(assert (=> start!20440 tp_is_empty!4951))

(declare-fun array_inv!2826 (array!9115) Bool)

(assert (=> start!20440 (array_inv!2826 _keys!825)))

(assert (=> start!20440 tp!18316))

(declare-fun b!202200 () Bool)

(declare-fun res!96840 () Bool)

(assert (=> b!202200 (=> (not res!96840) (not e!132445))))

(assert (=> b!202200 (= res!96840 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4633 _keys!825))))))

(assert (= (and start!20440 res!96836) b!202195))

(assert (= (and b!202195 res!96834) b!202194))

(assert (= (and b!202194 res!96833) b!202203))

(assert (= (and b!202203 res!96839) b!202200))

(assert (= (and b!202200 res!96840) b!202196))

(assert (= (and b!202196 res!96842) b!202202))

(assert (= (and b!202202 res!96835) b!202197))

(assert (= (and b!202197 (not res!96837)) b!202198))

(assert (= (and b!202198 res!96841) b!202193))

(assert (= (and b!202193 res!96838) b!202199))

(assert (= (and b!202201 condMapEmpty!8495) mapIsEmpty!8495))

(assert (= (and b!202201 (not condMapEmpty!8495)) mapNonEmpty!8495))

(get-info :version)

(assert (= (and mapNonEmpty!8495 ((_ is ValueCellFull!2132) mapValue!8495)) b!202204))

(assert (= (and b!202201 ((_ is ValueCellFull!2132) mapDefault!8495)) b!202205))

(assert (= start!20440 b!202201))

(declare-fun m!229047 () Bool)

(assert (=> b!202198 m!229047))

(declare-fun m!229049 () Bool)

(assert (=> b!202199 m!229049))

(declare-fun m!229051 () Bool)

(assert (=> b!202194 m!229051))

(declare-fun m!229053 () Bool)

(assert (=> b!202197 m!229053))

(declare-fun m!229055 () Bool)

(assert (=> b!202197 m!229055))

(declare-fun m!229057 () Bool)

(assert (=> b!202197 m!229057))

(declare-fun m!229059 () Bool)

(assert (=> b!202197 m!229059))

(declare-fun m!229061 () Bool)

(assert (=> b!202197 m!229061))

(declare-fun m!229063 () Bool)

(assert (=> b!202197 m!229063))

(declare-fun m!229065 () Bool)

(assert (=> b!202197 m!229065))

(declare-fun m!229067 () Bool)

(assert (=> b!202203 m!229067))

(declare-fun m!229069 () Bool)

(assert (=> b!202202 m!229069))

(declare-fun m!229071 () Bool)

(assert (=> b!202196 m!229071))

(declare-fun m!229073 () Bool)

(assert (=> b!202193 m!229073))

(declare-fun m!229075 () Bool)

(assert (=> mapNonEmpty!8495 m!229075))

(declare-fun m!229077 () Bool)

(assert (=> start!20440 m!229077))

(declare-fun m!229079 () Bool)

(assert (=> start!20440 m!229079))

(declare-fun m!229081 () Bool)

(assert (=> start!20440 m!229081))

(check-sat (not b!202196) b_and!11815 (not b!202197) (not b!202193) (not b_next!5095) (not b!202194) (not b!202198) (not b!202199) (not mapNonEmpty!8495) (not b!202203) tp_is_empty!4951 (not start!20440))
(check-sat b_and!11815 (not b_next!5095))
