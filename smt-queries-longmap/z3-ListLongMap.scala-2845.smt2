; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41042 () Bool)

(assert start!41042)

(declare-fun b_free!10969 () Bool)

(declare-fun b_next!10969 () Bool)

(assert (=> start!41042 (= b_free!10969 (not b_next!10969))))

(declare-fun tp!38736 () Bool)

(declare-fun b_and!19119 () Bool)

(assert (=> start!41042 (= tp!38736 b_and!19119)))

(declare-fun b!457449 () Bool)

(declare-fun res!273228 () Bool)

(declare-fun e!267131 () Bool)

(assert (=> b!457449 (=> (not res!273228) (not e!267131))))

(declare-datatypes ((array!28407 0))(
  ( (array!28408 (arr!13646 (Array (_ BitVec 32) (_ BitVec 64))) (size!13999 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28407)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457449 (= res!273228 (or (= (select (arr!13646 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13646 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457450 () Bool)

(declare-fun res!273226 () Bool)

(assert (=> b!457450 (=> (not res!273226) (not e!267131))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457450 (= res!273226 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!20104 () Bool)

(declare-fun mapRes!20104 () Bool)

(assert (=> mapIsEmpty!20104 mapRes!20104))

(declare-fun b!457451 () Bool)

(declare-fun res!273219 () Bool)

(assert (=> b!457451 (=> (not res!273219) (not e!267131))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457451 (= res!273219 (validMask!0 mask!1025))))

(declare-fun b!457452 () Bool)

(declare-fun e!267132 () Bool)

(declare-fun e!267125 () Bool)

(assert (=> b!457452 (= e!267132 (not e!267125))))

(declare-fun res!273227 () Bool)

(assert (=> b!457452 (=> res!273227 e!267125)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!457452 (= res!273227 (not (validKeyInArray!0 (select (arr!13646 _keys!709) from!863))))))

(declare-datatypes ((V!17515 0))(
  ( (V!17516 (val!6198 Int)) )
))
(declare-datatypes ((tuple2!8192 0))(
  ( (tuple2!8193 (_1!4107 (_ BitVec 64)) (_2!4107 V!17515)) )
))
(declare-datatypes ((List!8255 0))(
  ( (Nil!8252) (Cons!8251 (h!9107 tuple2!8192) (t!14094 List!8255)) )
))
(declare-datatypes ((ListLongMap!7095 0))(
  ( (ListLongMap!7096 (toList!3563 List!8255)) )
))
(declare-fun lt!206809 () ListLongMap!7095)

(declare-fun lt!206810 () ListLongMap!7095)

(assert (=> b!457452 (= lt!206809 lt!206810)))

(declare-fun lt!206811 () ListLongMap!7095)

(declare-fun v!412 () V!17515)

(declare-fun +!1617 (ListLongMap!7095 tuple2!8192) ListLongMap!7095)

(assert (=> b!457452 (= lt!206810 (+!1617 lt!206811 (tuple2!8193 k0!794 v!412)))))

(declare-fun minValue!515 () V!17515)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17515)

(declare-fun lt!206814 () array!28407)

(declare-datatypes ((ValueCell!5810 0))(
  ( (ValueCellFull!5810 (v!8462 V!17515)) (EmptyCell!5810) )
))
(declare-datatypes ((array!28409 0))(
  ( (array!28410 (arr!13647 (Array (_ BitVec 32) ValueCell!5810)) (size!14000 (_ BitVec 32))) )
))
(declare-fun lt!206808 () array!28409)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1757 (array!28407 array!28409 (_ BitVec 32) (_ BitVec 32) V!17515 V!17515 (_ BitVec 32) Int) ListLongMap!7095)

(assert (=> b!457452 (= lt!206809 (getCurrentListMapNoExtraKeys!1757 lt!206814 lt!206808 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28409)

(assert (=> b!457452 (= lt!206811 (getCurrentListMapNoExtraKeys!1757 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13281 0))(
  ( (Unit!13282) )
))
(declare-fun lt!206807 () Unit!13281)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!753 (array!28407 array!28409 (_ BitVec 32) (_ BitVec 32) V!17515 V!17515 (_ BitVec 32) (_ BitVec 64) V!17515 (_ BitVec 32) Int) Unit!13281)

(assert (=> b!457452 (= lt!206807 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457453 () Bool)

(declare-fun res!273225 () Bool)

(declare-fun e!267128 () Bool)

(assert (=> b!457453 (=> (not res!273225) (not e!267128))))

(assert (=> b!457453 (= res!273225 (bvsle from!863 i!563))))

(declare-fun b!457454 () Bool)

(declare-fun res!273230 () Bool)

(assert (=> b!457454 (=> (not res!273230) (not e!267131))))

(declare-fun arrayContainsKey!0 (array!28407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457454 (= res!273230 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457455 () Bool)

(assert (=> b!457455 (= e!267125 (or (not (= (select (arr!13646 _keys!709) from!863) k0!794)) (bvslt from!863 (size!13999 _keys!709))))))

(declare-fun lt!206812 () ListLongMap!7095)

(declare-fun get!6721 (ValueCell!5810 V!17515) V!17515)

(declare-fun dynLambda!878 (Int (_ BitVec 64)) V!17515)

(assert (=> b!457455 (= lt!206812 (+!1617 lt!206810 (tuple2!8193 (select (arr!13646 _keys!709) from!863) (get!6721 (select (arr!13647 _values!549) from!863) (dynLambda!878 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!273231 () Bool)

(assert (=> start!41042 (=> (not res!273231) (not e!267131))))

(assert (=> start!41042 (= res!273231 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13999 _keys!709))))))

(assert (=> start!41042 e!267131))

(declare-fun tp_is_empty!12307 () Bool)

(assert (=> start!41042 tp_is_empty!12307))

(assert (=> start!41042 tp!38736))

(assert (=> start!41042 true))

(declare-fun e!267127 () Bool)

(declare-fun array_inv!9940 (array!28409) Bool)

(assert (=> start!41042 (and (array_inv!9940 _values!549) e!267127)))

(declare-fun array_inv!9941 (array!28407) Bool)

(assert (=> start!41042 (array_inv!9941 _keys!709)))

(declare-fun b!457456 () Bool)

(assert (=> b!457456 (= e!267128 e!267132)))

(declare-fun res!273218 () Bool)

(assert (=> b!457456 (=> (not res!273218) (not e!267132))))

(assert (=> b!457456 (= res!273218 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!457456 (= lt!206812 (getCurrentListMapNoExtraKeys!1757 lt!206814 lt!206808 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457456 (= lt!206808 (array!28410 (store (arr!13647 _values!549) i!563 (ValueCellFull!5810 v!412)) (size!14000 _values!549)))))

(declare-fun lt!206813 () ListLongMap!7095)

(assert (=> b!457456 (= lt!206813 (getCurrentListMapNoExtraKeys!1757 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457457 () Bool)

(assert (=> b!457457 (= e!267131 e!267128)))

(declare-fun res!273223 () Bool)

(assert (=> b!457457 (=> (not res!273223) (not e!267128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28407 (_ BitVec 32)) Bool)

(assert (=> b!457457 (= res!273223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206814 mask!1025))))

(assert (=> b!457457 (= lt!206814 (array!28408 (store (arr!13646 _keys!709) i!563 k0!794) (size!13999 _keys!709)))))

(declare-fun b!457458 () Bool)

(declare-fun res!273220 () Bool)

(assert (=> b!457458 (=> (not res!273220) (not e!267131))))

(assert (=> b!457458 (= res!273220 (and (= (size!14000 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13999 _keys!709) (size!14000 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457459 () Bool)

(declare-fun e!267130 () Bool)

(assert (=> b!457459 (= e!267127 (and e!267130 mapRes!20104))))

(declare-fun condMapEmpty!20104 () Bool)

(declare-fun mapDefault!20104 () ValueCell!5810)

(assert (=> b!457459 (= condMapEmpty!20104 (= (arr!13647 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5810)) mapDefault!20104)))))

(declare-fun b!457460 () Bool)

(declare-fun res!273221 () Bool)

(assert (=> b!457460 (=> (not res!273221) (not e!267131))))

(assert (=> b!457460 (= res!273221 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13999 _keys!709))))))

(declare-fun b!457461 () Bool)

(declare-fun res!273229 () Bool)

(assert (=> b!457461 (=> (not res!273229) (not e!267128))))

(declare-datatypes ((List!8256 0))(
  ( (Nil!8253) (Cons!8252 (h!9108 (_ BitVec 64)) (t!14095 List!8256)) )
))
(declare-fun arrayNoDuplicates!0 (array!28407 (_ BitVec 32) List!8256) Bool)

(assert (=> b!457461 (= res!273229 (arrayNoDuplicates!0 lt!206814 #b00000000000000000000000000000000 Nil!8253))))

(declare-fun b!457462 () Bool)

(declare-fun e!267126 () Bool)

(assert (=> b!457462 (= e!267126 tp_is_empty!12307)))

(declare-fun b!457463 () Bool)

(declare-fun res!273222 () Bool)

(assert (=> b!457463 (=> (not res!273222) (not e!267131))))

(assert (=> b!457463 (= res!273222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457464 () Bool)

(declare-fun res!273224 () Bool)

(assert (=> b!457464 (=> (not res!273224) (not e!267131))))

(assert (=> b!457464 (= res!273224 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8253))))

(declare-fun b!457465 () Bool)

(assert (=> b!457465 (= e!267130 tp_is_empty!12307)))

(declare-fun mapNonEmpty!20104 () Bool)

(declare-fun tp!38737 () Bool)

(assert (=> mapNonEmpty!20104 (= mapRes!20104 (and tp!38737 e!267126))))

(declare-fun mapRest!20104 () (Array (_ BitVec 32) ValueCell!5810))

(declare-fun mapKey!20104 () (_ BitVec 32))

(declare-fun mapValue!20104 () ValueCell!5810)

(assert (=> mapNonEmpty!20104 (= (arr!13647 _values!549) (store mapRest!20104 mapKey!20104 mapValue!20104))))

(assert (= (and start!41042 res!273231) b!457451))

(assert (= (and b!457451 res!273219) b!457458))

(assert (= (and b!457458 res!273220) b!457463))

(assert (= (and b!457463 res!273222) b!457464))

(assert (= (and b!457464 res!273224) b!457460))

(assert (= (and b!457460 res!273221) b!457450))

(assert (= (and b!457450 res!273226) b!457449))

(assert (= (and b!457449 res!273228) b!457454))

(assert (= (and b!457454 res!273230) b!457457))

(assert (= (and b!457457 res!273223) b!457461))

(assert (= (and b!457461 res!273229) b!457453))

(assert (= (and b!457453 res!273225) b!457456))

(assert (= (and b!457456 res!273218) b!457452))

(assert (= (and b!457452 (not res!273227)) b!457455))

(assert (= (and b!457459 condMapEmpty!20104) mapIsEmpty!20104))

(assert (= (and b!457459 (not condMapEmpty!20104)) mapNonEmpty!20104))

(get-info :version)

(assert (= (and mapNonEmpty!20104 ((_ is ValueCellFull!5810) mapValue!20104)) b!457462))

(assert (= (and b!457459 ((_ is ValueCellFull!5810) mapDefault!20104)) b!457465))

(assert (= start!41042 b!457459))

(declare-fun b_lambda!9717 () Bool)

(assert (=> (not b_lambda!9717) (not b!457455)))

(declare-fun t!14093 () Bool)

(declare-fun tb!3797 () Bool)

(assert (=> (and start!41042 (= defaultEntry!557 defaultEntry!557) t!14093) tb!3797))

(declare-fun result!7143 () Bool)

(assert (=> tb!3797 (= result!7143 tp_is_empty!12307)))

(assert (=> b!457455 t!14093))

(declare-fun b_and!19121 () Bool)

(assert (= b_and!19119 (and (=> t!14093 result!7143) b_and!19121)))

(declare-fun m!440327 () Bool)

(assert (=> b!457451 m!440327))

(declare-fun m!440329 () Bool)

(assert (=> start!41042 m!440329))

(declare-fun m!440331 () Bool)

(assert (=> start!41042 m!440331))

(declare-fun m!440333 () Bool)

(assert (=> b!457449 m!440333))

(declare-fun m!440335 () Bool)

(assert (=> b!457457 m!440335))

(declare-fun m!440337 () Bool)

(assert (=> b!457457 m!440337))

(declare-fun m!440339 () Bool)

(assert (=> b!457454 m!440339))

(declare-fun m!440341 () Bool)

(assert (=> mapNonEmpty!20104 m!440341))

(declare-fun m!440343 () Bool)

(assert (=> b!457456 m!440343))

(declare-fun m!440345 () Bool)

(assert (=> b!457456 m!440345))

(declare-fun m!440347 () Bool)

(assert (=> b!457456 m!440347))

(declare-fun m!440349 () Bool)

(assert (=> b!457464 m!440349))

(declare-fun m!440351 () Bool)

(assert (=> b!457450 m!440351))

(declare-fun m!440353 () Bool)

(assert (=> b!457463 m!440353))

(declare-fun m!440355 () Bool)

(assert (=> b!457461 m!440355))

(declare-fun m!440357 () Bool)

(assert (=> b!457452 m!440357))

(declare-fun m!440359 () Bool)

(assert (=> b!457452 m!440359))

(declare-fun m!440361 () Bool)

(assert (=> b!457452 m!440361))

(declare-fun m!440363 () Bool)

(assert (=> b!457452 m!440363))

(assert (=> b!457452 m!440357))

(declare-fun m!440365 () Bool)

(assert (=> b!457452 m!440365))

(declare-fun m!440367 () Bool)

(assert (=> b!457452 m!440367))

(assert (=> b!457455 m!440357))

(declare-fun m!440369 () Bool)

(assert (=> b!457455 m!440369))

(declare-fun m!440371 () Bool)

(assert (=> b!457455 m!440371))

(declare-fun m!440373 () Bool)

(assert (=> b!457455 m!440373))

(assert (=> b!457455 m!440373))

(assert (=> b!457455 m!440369))

(declare-fun m!440375 () Bool)

(assert (=> b!457455 m!440375))

(check-sat (not b!457450) (not b!457456) b_and!19121 (not b!457451) (not b!457454) (not b!457455) (not b_lambda!9717) tp_is_empty!12307 (not b!457457) (not b!457464) (not start!41042) (not b!457461) (not mapNonEmpty!20104) (not b!457463) (not b_next!10969) (not b!457452))
(check-sat b_and!19121 (not b_next!10969))
