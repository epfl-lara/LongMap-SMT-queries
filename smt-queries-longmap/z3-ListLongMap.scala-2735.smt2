; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40214 () Bool)

(assert start!40214)

(declare-fun b_free!10495 () Bool)

(declare-fun b_next!10495 () Bool)

(assert (=> start!40214 (= b_free!10495 (not b_next!10495))))

(declare-fun tp!37014 () Bool)

(declare-fun b_and!18477 () Bool)

(assert (=> start!40214 (= tp!37014 b_and!18477)))

(declare-fun b!441187 () Bool)

(declare-fun e!259808 () Bool)

(declare-fun e!259809 () Bool)

(declare-fun mapRes!19092 () Bool)

(assert (=> b!441187 (= e!259808 (and e!259809 mapRes!19092))))

(declare-fun condMapEmpty!19092 () Bool)

(declare-datatypes ((V!16635 0))(
  ( (V!16636 (val!5868 Int)) )
))
(declare-datatypes ((ValueCell!5480 0))(
  ( (ValueCellFull!5480 (v!8116 V!16635)) (EmptyCell!5480) )
))
(declare-datatypes ((array!27114 0))(
  ( (array!27115 (arr!13006 (Array (_ BitVec 32) ValueCell!5480)) (size!13358 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27114)

(declare-fun mapDefault!19092 () ValueCell!5480)

(assert (=> b!441187 (= condMapEmpty!19092 (= (arr!13006 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5480)) mapDefault!19092)))))

(declare-fun b!441188 () Bool)

(declare-fun res!261150 () Bool)

(declare-fun e!259807 () Bool)

(assert (=> b!441188 (=> (not res!261150) (not e!259807))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27116 0))(
  ( (array!27117 (arr!13007 (Array (_ BitVec 32) (_ BitVec 64))) (size!13359 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27116)

(assert (=> b!441188 (= res!261150 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13359 _keys!709))))))

(declare-fun b!441189 () Bool)

(declare-fun tp_is_empty!11647 () Bool)

(assert (=> b!441189 (= e!259809 tp_is_empty!11647)))

(declare-fun b!441191 () Bool)

(declare-fun e!259811 () Bool)

(assert (=> b!441191 (= e!259811 tp_is_empty!11647)))

(declare-fun b!441192 () Bool)

(declare-fun res!261145 () Bool)

(declare-fun e!259812 () Bool)

(assert (=> b!441192 (=> (not res!261145) (not e!259812))))

(declare-fun lt!202854 () array!27116)

(declare-datatypes ((List!7700 0))(
  ( (Nil!7697) (Cons!7696 (h!8552 (_ BitVec 64)) (t!13448 List!7700)) )
))
(declare-fun arrayNoDuplicates!0 (array!27116 (_ BitVec 32) List!7700) Bool)

(assert (=> b!441192 (= res!261145 (arrayNoDuplicates!0 lt!202854 #b00000000000000000000000000000000 Nil!7697))))

(declare-fun b!441193 () Bool)

(declare-fun e!259813 () Bool)

(assert (=> b!441193 (= e!259812 e!259813)))

(declare-fun res!261147 () Bool)

(assert (=> b!441193 (=> (not res!261147) (not e!259813))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!441193 (= res!261147 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16635)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7710 0))(
  ( (tuple2!7711 (_1!3866 (_ BitVec 64)) (_2!3866 V!16635)) )
))
(declare-datatypes ((List!7701 0))(
  ( (Nil!7698) (Cons!7697 (h!8553 tuple2!7710) (t!13449 List!7701)) )
))
(declare-datatypes ((ListLongMap!6625 0))(
  ( (ListLongMap!6626 (toList!3328 List!7701)) )
))
(declare-fun lt!202850 () ListLongMap!6625)

(declare-fun zeroValue!515 () V!16635)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202851 () array!27114)

(declare-fun getCurrentListMapNoExtraKeys!1561 (array!27116 array!27114 (_ BitVec 32) (_ BitVec 32) V!16635 V!16635 (_ BitVec 32) Int) ListLongMap!6625)

(assert (=> b!441193 (= lt!202850 (getCurrentListMapNoExtraKeys!1561 lt!202854 lt!202851 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16635)

(assert (=> b!441193 (= lt!202851 (array!27115 (store (arr!13006 _values!549) i!563 (ValueCellFull!5480 v!412)) (size!13358 _values!549)))))

(declare-fun lt!202853 () ListLongMap!6625)

(assert (=> b!441193 (= lt!202853 (getCurrentListMapNoExtraKeys!1561 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441194 () Bool)

(assert (=> b!441194 (= e!259813 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1517 (ListLongMap!6625 tuple2!7710) ListLongMap!6625)

(assert (=> b!441194 (= (getCurrentListMapNoExtraKeys!1561 lt!202854 lt!202851 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1517 (getCurrentListMapNoExtraKeys!1561 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7711 k0!794 v!412)))))

(declare-datatypes ((Unit!13109 0))(
  ( (Unit!13110) )
))
(declare-fun lt!202852 () Unit!13109)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!677 (array!27116 array!27114 (_ BitVec 32) (_ BitVec 32) V!16635 V!16635 (_ BitVec 32) (_ BitVec 64) V!16635 (_ BitVec 32) Int) Unit!13109)

(assert (=> b!441194 (= lt!202852 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!677 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441195 () Bool)

(declare-fun res!261142 () Bool)

(assert (=> b!441195 (=> (not res!261142) (not e!259812))))

(assert (=> b!441195 (= res!261142 (bvsle from!863 i!563))))

(declare-fun b!441196 () Bool)

(declare-fun res!261149 () Bool)

(assert (=> b!441196 (=> (not res!261149) (not e!259807))))

(assert (=> b!441196 (= res!261149 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7697))))

(declare-fun b!441197 () Bool)

(declare-fun res!261141 () Bool)

(assert (=> b!441197 (=> (not res!261141) (not e!259807))))

(assert (=> b!441197 (= res!261141 (or (= (select (arr!13007 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13007 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19092 () Bool)

(assert (=> mapIsEmpty!19092 mapRes!19092))

(declare-fun b!441198 () Bool)

(declare-fun res!261151 () Bool)

(assert (=> b!441198 (=> (not res!261151) (not e!259807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27116 (_ BitVec 32)) Bool)

(assert (=> b!441198 (= res!261151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441199 () Bool)

(declare-fun res!261144 () Bool)

(assert (=> b!441199 (=> (not res!261144) (not e!259807))))

(assert (=> b!441199 (= res!261144 (and (= (size!13358 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13359 _keys!709) (size!13358 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441200 () Bool)

(declare-fun res!261148 () Bool)

(assert (=> b!441200 (=> (not res!261148) (not e!259807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441200 (= res!261148 (validKeyInArray!0 k0!794))))

(declare-fun b!441201 () Bool)

(declare-fun res!261146 () Bool)

(assert (=> b!441201 (=> (not res!261146) (not e!259807))))

(declare-fun arrayContainsKey!0 (array!27116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441201 (= res!261146 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441202 () Bool)

(declare-fun res!261152 () Bool)

(assert (=> b!441202 (=> (not res!261152) (not e!259807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441202 (= res!261152 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19092 () Bool)

(declare-fun tp!37013 () Bool)

(assert (=> mapNonEmpty!19092 (= mapRes!19092 (and tp!37013 e!259811))))

(declare-fun mapValue!19092 () ValueCell!5480)

(declare-fun mapKey!19092 () (_ BitVec 32))

(declare-fun mapRest!19092 () (Array (_ BitVec 32) ValueCell!5480))

(assert (=> mapNonEmpty!19092 (= (arr!13006 _values!549) (store mapRest!19092 mapKey!19092 mapValue!19092))))

(declare-fun res!261153 () Bool)

(assert (=> start!40214 (=> (not res!261153) (not e!259807))))

(assert (=> start!40214 (= res!261153 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13359 _keys!709))))))

(assert (=> start!40214 e!259807))

(assert (=> start!40214 tp_is_empty!11647))

(assert (=> start!40214 tp!37014))

(assert (=> start!40214 true))

(declare-fun array_inv!9502 (array!27114) Bool)

(assert (=> start!40214 (and (array_inv!9502 _values!549) e!259808)))

(declare-fun array_inv!9503 (array!27116) Bool)

(assert (=> start!40214 (array_inv!9503 _keys!709)))

(declare-fun b!441190 () Bool)

(assert (=> b!441190 (= e!259807 e!259812)))

(declare-fun res!261143 () Bool)

(assert (=> b!441190 (=> (not res!261143) (not e!259812))))

(assert (=> b!441190 (= res!261143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202854 mask!1025))))

(assert (=> b!441190 (= lt!202854 (array!27117 (store (arr!13007 _keys!709) i!563 k0!794) (size!13359 _keys!709)))))

(assert (= (and start!40214 res!261153) b!441202))

(assert (= (and b!441202 res!261152) b!441199))

(assert (= (and b!441199 res!261144) b!441198))

(assert (= (and b!441198 res!261151) b!441196))

(assert (= (and b!441196 res!261149) b!441188))

(assert (= (and b!441188 res!261150) b!441200))

(assert (= (and b!441200 res!261148) b!441197))

(assert (= (and b!441197 res!261141) b!441201))

(assert (= (and b!441201 res!261146) b!441190))

(assert (= (and b!441190 res!261143) b!441192))

(assert (= (and b!441192 res!261145) b!441195))

(assert (= (and b!441195 res!261142) b!441193))

(assert (= (and b!441193 res!261147) b!441194))

(assert (= (and b!441187 condMapEmpty!19092) mapIsEmpty!19092))

(assert (= (and b!441187 (not condMapEmpty!19092)) mapNonEmpty!19092))

(get-info :version)

(assert (= (and mapNonEmpty!19092 ((_ is ValueCellFull!5480) mapValue!19092)) b!441191))

(assert (= (and b!441187 ((_ is ValueCellFull!5480) mapDefault!19092)) b!441189))

(assert (= start!40214 b!441187))

(declare-fun m!428333 () Bool)

(assert (=> b!441196 m!428333))

(declare-fun m!428335 () Bool)

(assert (=> start!40214 m!428335))

(declare-fun m!428337 () Bool)

(assert (=> start!40214 m!428337))

(declare-fun m!428339 () Bool)

(assert (=> b!441201 m!428339))

(declare-fun m!428341 () Bool)

(assert (=> b!441202 m!428341))

(declare-fun m!428343 () Bool)

(assert (=> b!441197 m!428343))

(declare-fun m!428345 () Bool)

(assert (=> b!441198 m!428345))

(declare-fun m!428347 () Bool)

(assert (=> b!441194 m!428347))

(declare-fun m!428349 () Bool)

(assert (=> b!441194 m!428349))

(assert (=> b!441194 m!428349))

(declare-fun m!428351 () Bool)

(assert (=> b!441194 m!428351))

(declare-fun m!428353 () Bool)

(assert (=> b!441194 m!428353))

(declare-fun m!428355 () Bool)

(assert (=> b!441192 m!428355))

(declare-fun m!428357 () Bool)

(assert (=> b!441200 m!428357))

(declare-fun m!428359 () Bool)

(assert (=> mapNonEmpty!19092 m!428359))

(declare-fun m!428361 () Bool)

(assert (=> b!441193 m!428361))

(declare-fun m!428363 () Bool)

(assert (=> b!441193 m!428363))

(declare-fun m!428365 () Bool)

(assert (=> b!441193 m!428365))

(declare-fun m!428367 () Bool)

(assert (=> b!441190 m!428367))

(declare-fun m!428369 () Bool)

(assert (=> b!441190 m!428369))

(check-sat (not b!441201) b_and!18477 (not b!441193) (not b!441202) (not mapNonEmpty!19092) (not b!441194) (not b!441196) tp_is_empty!11647 (not b!441192) (not start!40214) (not b!441198) (not b!441200) (not b!441190) (not b_next!10495))
(check-sat b_and!18477 (not b_next!10495))
