; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39702 () Bool)

(assert start!39702)

(declare-fun b_free!9969 () Bool)

(declare-fun b_next!9969 () Bool)

(assert (=> start!39702 (= b_free!9969 (not b_next!9969))))

(declare-fun tp!35436 () Bool)

(declare-fun b_and!17625 () Bool)

(assert (=> start!39702 (= tp!35436 b_and!17625)))

(declare-fun res!250091 () Bool)

(declare-fun e!253102 () Bool)

(assert (=> start!39702 (=> (not res!250091) (not e!253102))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26081 0))(
  ( (array!26082 (arr!12490 (Array (_ BitVec 32) (_ BitVec 64))) (size!12842 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26081)

(assert (=> start!39702 (= res!250091 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12842 _keys!709))))))

(assert (=> start!39702 e!253102))

(declare-fun tp_is_empty!11121 () Bool)

(assert (=> start!39702 tp_is_empty!11121))

(assert (=> start!39702 tp!35436))

(assert (=> start!39702 true))

(declare-datatypes ((V!15933 0))(
  ( (V!15934 (val!5605 Int)) )
))
(declare-datatypes ((ValueCell!5217 0))(
  ( (ValueCellFull!5217 (v!7852 V!15933)) (EmptyCell!5217) )
))
(declare-datatypes ((array!26083 0))(
  ( (array!26084 (arr!12491 (Array (_ BitVec 32) ValueCell!5217)) (size!12843 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26083)

(declare-fun e!253107 () Bool)

(declare-fun array_inv!9106 (array!26083) Bool)

(assert (=> start!39702 (and (array_inv!9106 _values!549) e!253107)))

(declare-fun array_inv!9107 (array!26081) Bool)

(assert (=> start!39702 (array_inv!9107 _keys!709)))

(declare-fun b!426671 () Bool)

(declare-fun res!250090 () Bool)

(assert (=> b!426671 (=> (not res!250090) (not e!253102))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26081 (_ BitVec 32)) Bool)

(assert (=> b!426671 (= res!250090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426672 () Bool)

(declare-fun e!253103 () Bool)

(declare-fun e!253106 () Bool)

(assert (=> b!426672 (= e!253103 e!253106)))

(declare-fun res!250095 () Bool)

(assert (=> b!426672 (=> (not res!250095) (not e!253106))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426672 (= res!250095 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15933)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15933)

(declare-fun lt!195034 () array!26081)

(declare-fun lt!195036 () array!26083)

(declare-datatypes ((tuple2!7366 0))(
  ( (tuple2!7367 (_1!3694 (_ BitVec 64)) (_2!3694 V!15933)) )
))
(declare-datatypes ((List!7381 0))(
  ( (Nil!7378) (Cons!7377 (h!8233 tuple2!7366) (t!12825 List!7381)) )
))
(declare-datatypes ((ListLongMap!6279 0))(
  ( (ListLongMap!6280 (toList!3155 List!7381)) )
))
(declare-fun lt!195037 () ListLongMap!6279)

(declare-fun getCurrentListMapNoExtraKeys!1359 (array!26081 array!26083 (_ BitVec 32) (_ BitVec 32) V!15933 V!15933 (_ BitVec 32) Int) ListLongMap!6279)

(assert (=> b!426672 (= lt!195037 (getCurrentListMapNoExtraKeys!1359 lt!195034 lt!195036 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15933)

(assert (=> b!426672 (= lt!195036 (array!26084 (store (arr!12491 _values!549) i!563 (ValueCellFull!5217 v!412)) (size!12843 _values!549)))))

(declare-fun lt!195038 () ListLongMap!6279)

(assert (=> b!426672 (= lt!195038 (getCurrentListMapNoExtraKeys!1359 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426673 () Bool)

(declare-fun res!250098 () Bool)

(assert (=> b!426673 (=> (not res!250098) (not e!253103))))

(declare-datatypes ((List!7382 0))(
  ( (Nil!7379) (Cons!7378 (h!8234 (_ BitVec 64)) (t!12826 List!7382)) )
))
(declare-fun arrayNoDuplicates!0 (array!26081 (_ BitVec 32) List!7382) Bool)

(assert (=> b!426673 (= res!250098 (arrayNoDuplicates!0 lt!195034 #b00000000000000000000000000000000 Nil!7379))))

(declare-fun mapIsEmpty!18303 () Bool)

(declare-fun mapRes!18303 () Bool)

(assert (=> mapIsEmpty!18303 mapRes!18303))

(declare-fun b!426674 () Bool)

(declare-fun res!250094 () Bool)

(assert (=> b!426674 (=> (not res!250094) (not e!253103))))

(assert (=> b!426674 (= res!250094 (bvsle from!863 i!563))))

(declare-fun b!426675 () Bool)

(declare-fun e!253105 () Bool)

(assert (=> b!426675 (= e!253107 (and e!253105 mapRes!18303))))

(declare-fun condMapEmpty!18303 () Bool)

(declare-fun mapDefault!18303 () ValueCell!5217)

(assert (=> b!426675 (= condMapEmpty!18303 (= (arr!12491 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5217)) mapDefault!18303)))))

(declare-fun b!426676 () Bool)

(declare-fun res!250086 () Bool)

(assert (=> b!426676 (=> (not res!250086) (not e!253102))))

(assert (=> b!426676 (= res!250086 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7379))))

(declare-fun b!426677 () Bool)

(assert (=> b!426677 (= e!253102 e!253103)))

(declare-fun res!250089 () Bool)

(assert (=> b!426677 (=> (not res!250089) (not e!253103))))

(assert (=> b!426677 (= res!250089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195034 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!426677 (= lt!195034 (array!26082 (store (arr!12490 _keys!709) i!563 k0!794) (size!12842 _keys!709)))))

(declare-fun b!426678 () Bool)

(assert (=> b!426678 (= e!253105 tp_is_empty!11121)))

(declare-fun mapNonEmpty!18303 () Bool)

(declare-fun tp!35435 () Bool)

(declare-fun e!253104 () Bool)

(assert (=> mapNonEmpty!18303 (= mapRes!18303 (and tp!35435 e!253104))))

(declare-fun mapValue!18303 () ValueCell!5217)

(declare-fun mapKey!18303 () (_ BitVec 32))

(declare-fun mapRest!18303 () (Array (_ BitVec 32) ValueCell!5217))

(assert (=> mapNonEmpty!18303 (= (arr!12491 _values!549) (store mapRest!18303 mapKey!18303 mapValue!18303))))

(declare-fun b!426679 () Bool)

(assert (=> b!426679 (= e!253104 tp_is_empty!11121)))

(declare-fun b!426680 () Bool)

(assert (=> b!426680 (= e!253106 (not true))))

(declare-fun +!1312 (ListLongMap!6279 tuple2!7366) ListLongMap!6279)

(assert (=> b!426680 (= (getCurrentListMapNoExtraKeys!1359 lt!195034 lt!195036 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1312 (getCurrentListMapNoExtraKeys!1359 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7367 k0!794 v!412)))))

(declare-datatypes ((Unit!12526 0))(
  ( (Unit!12527) )
))
(declare-fun lt!195035 () Unit!12526)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!507 (array!26081 array!26083 (_ BitVec 32) (_ BitVec 32) V!15933 V!15933 (_ BitVec 32) (_ BitVec 64) V!15933 (_ BitVec 32) Int) Unit!12526)

(assert (=> b!426680 (= lt!195035 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!507 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426681 () Bool)

(declare-fun res!250097 () Bool)

(assert (=> b!426681 (=> (not res!250097) (not e!253102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426681 (= res!250097 (validMask!0 mask!1025))))

(declare-fun b!426682 () Bool)

(declare-fun res!250088 () Bool)

(assert (=> b!426682 (=> (not res!250088) (not e!253102))))

(assert (=> b!426682 (= res!250088 (and (= (size!12843 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12842 _keys!709) (size!12843 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426683 () Bool)

(declare-fun res!250093 () Bool)

(assert (=> b!426683 (=> (not res!250093) (not e!253102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426683 (= res!250093 (validKeyInArray!0 k0!794))))

(declare-fun b!426684 () Bool)

(declare-fun res!250087 () Bool)

(assert (=> b!426684 (=> (not res!250087) (not e!253102))))

(declare-fun arrayContainsKey!0 (array!26081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426684 (= res!250087 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426685 () Bool)

(declare-fun res!250096 () Bool)

(assert (=> b!426685 (=> (not res!250096) (not e!253102))))

(assert (=> b!426685 (= res!250096 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12842 _keys!709))))))

(declare-fun b!426686 () Bool)

(declare-fun res!250092 () Bool)

(assert (=> b!426686 (=> (not res!250092) (not e!253102))))

(assert (=> b!426686 (= res!250092 (or (= (select (arr!12490 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12490 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39702 res!250091) b!426681))

(assert (= (and b!426681 res!250097) b!426682))

(assert (= (and b!426682 res!250088) b!426671))

(assert (= (and b!426671 res!250090) b!426676))

(assert (= (and b!426676 res!250086) b!426685))

(assert (= (and b!426685 res!250096) b!426683))

(assert (= (and b!426683 res!250093) b!426686))

(assert (= (and b!426686 res!250092) b!426684))

(assert (= (and b!426684 res!250087) b!426677))

(assert (= (and b!426677 res!250089) b!426673))

(assert (= (and b!426673 res!250098) b!426674))

(assert (= (and b!426674 res!250094) b!426672))

(assert (= (and b!426672 res!250095) b!426680))

(assert (= (and b!426675 condMapEmpty!18303) mapIsEmpty!18303))

(assert (= (and b!426675 (not condMapEmpty!18303)) mapNonEmpty!18303))

(get-info :version)

(assert (= (and mapNonEmpty!18303 ((_ is ValueCellFull!5217) mapValue!18303)) b!426679))

(assert (= (and b!426675 ((_ is ValueCellFull!5217) mapDefault!18303)) b!426678))

(assert (= start!39702 b!426675))

(declare-fun m!415313 () Bool)

(assert (=> b!426672 m!415313))

(declare-fun m!415315 () Bool)

(assert (=> b!426672 m!415315))

(declare-fun m!415317 () Bool)

(assert (=> b!426672 m!415317))

(declare-fun m!415319 () Bool)

(assert (=> b!426676 m!415319))

(declare-fun m!415321 () Bool)

(assert (=> b!426684 m!415321))

(declare-fun m!415323 () Bool)

(assert (=> b!426680 m!415323))

(declare-fun m!415325 () Bool)

(assert (=> b!426680 m!415325))

(assert (=> b!426680 m!415325))

(declare-fun m!415327 () Bool)

(assert (=> b!426680 m!415327))

(declare-fun m!415329 () Bool)

(assert (=> b!426680 m!415329))

(declare-fun m!415331 () Bool)

(assert (=> b!426683 m!415331))

(declare-fun m!415333 () Bool)

(assert (=> b!426686 m!415333))

(declare-fun m!415335 () Bool)

(assert (=> b!426681 m!415335))

(declare-fun m!415337 () Bool)

(assert (=> b!426677 m!415337))

(declare-fun m!415339 () Bool)

(assert (=> b!426677 m!415339))

(declare-fun m!415341 () Bool)

(assert (=> b!426673 m!415341))

(declare-fun m!415343 () Bool)

(assert (=> b!426671 m!415343))

(declare-fun m!415345 () Bool)

(assert (=> start!39702 m!415345))

(declare-fun m!415347 () Bool)

(assert (=> start!39702 m!415347))

(declare-fun m!415349 () Bool)

(assert (=> mapNonEmpty!18303 m!415349))

(check-sat (not b!426673) (not b!426671) b_and!17625 (not b!426683) (not b!426677) (not mapNonEmpty!18303) (not b!426681) (not b!426676) tp_is_empty!11121 (not start!39702) (not b!426680) (not b!426684) (not b!426672) (not b_next!9969))
(check-sat b_and!17625 (not b_next!9969))
