; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39146 () Bool)

(assert start!39146)

(declare-fun b_free!9427 () Bool)

(declare-fun b_next!9427 () Bool)

(assert (=> start!39146 (= b_free!9427 (not b_next!9427))))

(declare-fun tp!33810 () Bool)

(declare-fun b_and!16827 () Bool)

(assert (=> start!39146 (= tp!33810 b_and!16827)))

(declare-fun b!412163 () Bool)

(declare-fun res!239313 () Bool)

(declare-fun e!246684 () Bool)

(assert (=> b!412163 (=> (not res!239313) (not e!246684))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412163 (= res!239313 (bvsle from!863 i!563))))

(declare-fun b!412164 () Bool)

(declare-fun res!239308 () Bool)

(declare-fun e!246688 () Bool)

(assert (=> b!412164 (=> (not res!239308) (not e!246688))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412164 (= res!239308 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17490 () Bool)

(declare-fun mapRes!17490 () Bool)

(declare-fun tp!33809 () Bool)

(declare-fun e!246686 () Bool)

(assert (=> mapNonEmpty!17490 (= mapRes!17490 (and tp!33809 e!246686))))

(declare-datatypes ((V!15211 0))(
  ( (V!15212 (val!5334 Int)) )
))
(declare-datatypes ((ValueCell!4946 0))(
  ( (ValueCellFull!4946 (v!7582 V!15211)) (EmptyCell!4946) )
))
(declare-fun mapValue!17490 () ValueCell!4946)

(declare-datatypes ((array!25020 0))(
  ( (array!25021 (arr!11959 (Array (_ BitVec 32) ValueCell!4946)) (size!12311 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25020)

(declare-fun mapRest!17490 () (Array (_ BitVec 32) ValueCell!4946))

(declare-fun mapKey!17490 () (_ BitVec 32))

(assert (=> mapNonEmpty!17490 (= (arr!11959 _values!549) (store mapRest!17490 mapKey!17490 mapValue!17490))))

(declare-fun b!412165 () Bool)

(declare-fun res!239307 () Bool)

(assert (=> b!412165 (=> (not res!239307) (not e!246684))))

(declare-datatypes ((array!25022 0))(
  ( (array!25023 (arr!11960 (Array (_ BitVec 32) (_ BitVec 64))) (size!12312 (_ BitVec 32))) )
))
(declare-fun lt!189455 () array!25022)

(declare-datatypes ((List!6812 0))(
  ( (Nil!6809) (Cons!6808 (h!7664 (_ BitVec 64)) (t!11978 List!6812)) )
))
(declare-fun arrayNoDuplicates!0 (array!25022 (_ BitVec 32) List!6812) Bool)

(assert (=> b!412165 (= res!239307 (arrayNoDuplicates!0 lt!189455 #b00000000000000000000000000000000 Nil!6809))))

(declare-fun mapIsEmpty!17490 () Bool)

(assert (=> mapIsEmpty!17490 mapRes!17490))

(declare-fun b!412166 () Bool)

(declare-fun e!246685 () Bool)

(declare-fun tp_is_empty!10579 () Bool)

(assert (=> b!412166 (= e!246685 tp_is_empty!10579)))

(declare-fun b!412167 () Bool)

(assert (=> b!412167 (= e!246686 tp_is_empty!10579)))

(declare-fun b!412168 () Bool)

(declare-fun res!239310 () Bool)

(assert (=> b!412168 (=> (not res!239310) (not e!246688))))

(declare-fun _keys!709 () array!25022)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25022 (_ BitVec 32)) Bool)

(assert (=> b!412168 (= res!239310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412169 () Bool)

(declare-fun res!239305 () Bool)

(assert (=> b!412169 (=> (not res!239305) (not e!246688))))

(assert (=> b!412169 (= res!239305 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6809))))

(declare-fun b!412171 () Bool)

(assert (=> b!412171 (= e!246688 e!246684)))

(declare-fun res!239306 () Bool)

(assert (=> b!412171 (=> (not res!239306) (not e!246684))))

(assert (=> b!412171 (= res!239306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189455 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!412171 (= lt!189455 (array!25023 (store (arr!11960 _keys!709) i!563 k0!794) (size!12312 _keys!709)))))

(declare-fun b!412172 () Bool)

(declare-fun e!246683 () Bool)

(assert (=> b!412172 (= e!246683 (and e!246685 mapRes!17490))))

(declare-fun condMapEmpty!17490 () Bool)

(declare-fun mapDefault!17490 () ValueCell!4946)

(assert (=> b!412172 (= condMapEmpty!17490 (= (arr!11959 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4946)) mapDefault!17490)))))

(declare-fun b!412173 () Bool)

(declare-fun res!239312 () Bool)

(assert (=> b!412173 (=> (not res!239312) (not e!246688))))

(declare-fun arrayContainsKey!0 (array!25022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412173 (= res!239312 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412174 () Bool)

(declare-fun res!239316 () Bool)

(assert (=> b!412174 (=> (not res!239316) (not e!246688))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412174 (= res!239316 (and (= (size!12311 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12312 _keys!709) (size!12311 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412175 () Bool)

(declare-fun res!239315 () Bool)

(assert (=> b!412175 (=> (not res!239315) (not e!246688))))

(assert (=> b!412175 (= res!239315 (or (= (select (arr!11960 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11960 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412176 () Bool)

(assert (=> b!412176 (= e!246684 false)))

(declare-fun minValue!515 () V!15211)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6792 0))(
  ( (tuple2!6793 (_1!3407 (_ BitVec 64)) (_2!3407 V!15211)) )
))
(declare-datatypes ((List!6813 0))(
  ( (Nil!6810) (Cons!6809 (h!7665 tuple2!6792) (t!11979 List!6813)) )
))
(declare-datatypes ((ListLongMap!5707 0))(
  ( (ListLongMap!5708 (toList!2869 List!6813)) )
))
(declare-fun lt!189456 () ListLongMap!5707)

(declare-fun zeroValue!515 () V!15211)

(declare-fun v!412 () V!15211)

(declare-fun getCurrentListMapNoExtraKeys!1121 (array!25022 array!25020 (_ BitVec 32) (_ BitVec 32) V!15211 V!15211 (_ BitVec 32) Int) ListLongMap!5707)

(assert (=> b!412176 (= lt!189456 (getCurrentListMapNoExtraKeys!1121 lt!189455 (array!25021 (store (arr!11959 _values!549) i!563 (ValueCellFull!4946 v!412)) (size!12311 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189454 () ListLongMap!5707)

(assert (=> b!412176 (= lt!189454 (getCurrentListMapNoExtraKeys!1121 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412177 () Bool)

(declare-fun res!239314 () Bool)

(assert (=> b!412177 (=> (not res!239314) (not e!246688))))

(assert (=> b!412177 (= res!239314 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12312 _keys!709))))))

(declare-fun res!239309 () Bool)

(assert (=> start!39146 (=> (not res!239309) (not e!246688))))

(assert (=> start!39146 (= res!239309 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12312 _keys!709))))))

(assert (=> start!39146 e!246688))

(assert (=> start!39146 tp_is_empty!10579))

(assert (=> start!39146 tp!33810))

(assert (=> start!39146 true))

(declare-fun array_inv!8802 (array!25020) Bool)

(assert (=> start!39146 (and (array_inv!8802 _values!549) e!246683)))

(declare-fun array_inv!8803 (array!25022) Bool)

(assert (=> start!39146 (array_inv!8803 _keys!709)))

(declare-fun b!412170 () Bool)

(declare-fun res!239311 () Bool)

(assert (=> b!412170 (=> (not res!239311) (not e!246688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412170 (= res!239311 (validKeyInArray!0 k0!794))))

(assert (= (and start!39146 res!239309) b!412164))

(assert (= (and b!412164 res!239308) b!412174))

(assert (= (and b!412174 res!239316) b!412168))

(assert (= (and b!412168 res!239310) b!412169))

(assert (= (and b!412169 res!239305) b!412177))

(assert (= (and b!412177 res!239314) b!412170))

(assert (= (and b!412170 res!239311) b!412175))

(assert (= (and b!412175 res!239315) b!412173))

(assert (= (and b!412173 res!239312) b!412171))

(assert (= (and b!412171 res!239306) b!412165))

(assert (= (and b!412165 res!239307) b!412163))

(assert (= (and b!412163 res!239313) b!412176))

(assert (= (and b!412172 condMapEmpty!17490) mapIsEmpty!17490))

(assert (= (and b!412172 (not condMapEmpty!17490)) mapNonEmpty!17490))

(get-info :version)

(assert (= (and mapNonEmpty!17490 ((_ is ValueCellFull!4946) mapValue!17490)) b!412167))

(assert (= (and b!412172 ((_ is ValueCellFull!4946) mapDefault!17490)) b!412166))

(assert (= start!39146 b!412172))

(declare-fun m!402333 () Bool)

(assert (=> b!412175 m!402333))

(declare-fun m!402335 () Bool)

(assert (=> b!412168 m!402335))

(declare-fun m!402337 () Bool)

(assert (=> b!412170 m!402337))

(declare-fun m!402339 () Bool)

(assert (=> mapNonEmpty!17490 m!402339))

(declare-fun m!402341 () Bool)

(assert (=> start!39146 m!402341))

(declare-fun m!402343 () Bool)

(assert (=> start!39146 m!402343))

(declare-fun m!402345 () Bool)

(assert (=> b!412173 m!402345))

(declare-fun m!402347 () Bool)

(assert (=> b!412171 m!402347))

(declare-fun m!402349 () Bool)

(assert (=> b!412171 m!402349))

(declare-fun m!402351 () Bool)

(assert (=> b!412165 m!402351))

(declare-fun m!402353 () Bool)

(assert (=> b!412169 m!402353))

(declare-fun m!402355 () Bool)

(assert (=> b!412176 m!402355))

(declare-fun m!402357 () Bool)

(assert (=> b!412176 m!402357))

(declare-fun m!402359 () Bool)

(assert (=> b!412176 m!402359))

(declare-fun m!402361 () Bool)

(assert (=> b!412164 m!402361))

(check-sat (not b!412164) (not b!412168) (not b!412176) (not start!39146) (not b!412170) (not b!412169) (not b!412165) b_and!16827 (not b!412171) (not b_next!9427) tp_is_empty!10579 (not mapNonEmpty!17490) (not b!412173))
(check-sat b_and!16827 (not b_next!9427))
