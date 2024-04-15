; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38696 () Bool)

(assert start!38696)

(declare-fun b_free!9247 () Bool)

(declare-fun b_next!9247 () Bool)

(assert (=> start!38696 (= b_free!9247 (not b_next!9247))))

(declare-fun tp!32865 () Bool)

(declare-fun b_and!16607 () Bool)

(assert (=> start!38696 (= tp!32865 b_and!16607)))

(declare-fun b!402486 () Bool)

(declare-fun res!231898 () Bool)

(declare-fun e!242425 () Bool)

(assert (=> b!402486 (=> (not res!231898) (not e!242425))))

(declare-datatypes ((array!24139 0))(
  ( (array!24140 (arr!11519 (Array (_ BitVec 32) (_ BitVec 64))) (size!11872 (_ BitVec 32))) )
))
(declare-fun lt!187733 () array!24139)

(declare-datatypes ((List!6673 0))(
  ( (Nil!6670) (Cons!6669 (h!7525 (_ BitVec 64)) (t!11838 List!6673)) )
))
(declare-fun arrayNoDuplicates!0 (array!24139 (_ BitVec 32) List!6673) Bool)

(assert (=> b!402486 (= res!231898 (arrayNoDuplicates!0 lt!187733 #b00000000000000000000000000000000 Nil!6670))))

(declare-fun mapIsEmpty!16815 () Bool)

(declare-fun mapRes!16815 () Bool)

(assert (=> mapIsEmpty!16815 mapRes!16815))

(declare-fun b!402487 () Bool)

(declare-fun e!242424 () Bool)

(assert (=> b!402487 (= e!242424 e!242425)))

(declare-fun res!231889 () Bool)

(assert (=> b!402487 (=> (not res!231889) (not e!242425))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24139 (_ BitVec 32)) Bool)

(assert (=> b!402487 (= res!231889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187733 mask!1025))))

(declare-fun _keys!709 () array!24139)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402487 (= lt!187733 (array!24140 (store (arr!11519 _keys!709) i!563 k0!794) (size!11872 _keys!709)))))

(declare-fun b!402488 () Bool)

(declare-fun e!242421 () Bool)

(declare-fun tp_is_empty!10129 () Bool)

(assert (=> b!402488 (= e!242421 tp_is_empty!10129)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14611 0))(
  ( (V!14612 (val!5109 Int)) )
))
(declare-datatypes ((tuple2!6770 0))(
  ( (tuple2!6771 (_1!3396 (_ BitVec 64)) (_2!3396 V!14611)) )
))
(declare-datatypes ((List!6674 0))(
  ( (Nil!6671) (Cons!6670 (h!7526 tuple2!6770) (t!11839 List!6674)) )
))
(declare-datatypes ((ListLongMap!5673 0))(
  ( (ListLongMap!5674 (toList!2852 List!6674)) )
))
(declare-fun call!28381 () ListLongMap!5673)

(declare-datatypes ((ValueCell!4721 0))(
  ( (ValueCellFull!4721 (v!7350 V!14611)) (EmptyCell!4721) )
))
(declare-datatypes ((array!24141 0))(
  ( (array!24142 (arr!11520 (Array (_ BitVec 32) ValueCell!4721)) (size!11873 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24141)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!14611)

(declare-fun c!54756 () Bool)

(declare-fun zeroValue!515 () V!14611)

(declare-fun bm!28377 () Bool)

(declare-fun v!412 () V!14611)

(declare-fun getCurrentListMapNoExtraKeys!1068 (array!24139 array!24141 (_ BitVec 32) (_ BitVec 32) V!14611 V!14611 (_ BitVec 32) Int) ListLongMap!5673)

(assert (=> bm!28377 (= call!28381 (getCurrentListMapNoExtraKeys!1068 (ite c!54756 lt!187733 _keys!709) (ite c!54756 (array!24142 (store (arr!11520 _values!549) i!563 (ValueCellFull!4721 v!412)) (size!11873 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402489 () Bool)

(declare-fun res!231890 () Bool)

(assert (=> b!402489 (=> (not res!231890) (not e!242424))))

(assert (=> b!402489 (= res!231890 (and (= (size!11873 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11872 _keys!709) (size!11873 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402490 () Bool)

(declare-fun res!231897 () Bool)

(assert (=> b!402490 (=> (not res!231897) (not e!242424))))

(assert (=> b!402490 (= res!231897 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6670))))

(declare-fun b!402491 () Bool)

(declare-fun e!242422 () Bool)

(assert (=> b!402491 (= e!242422 tp_is_empty!10129)))

(declare-fun b!402492 () Bool)

(declare-fun res!231899 () Bool)

(assert (=> b!402492 (=> (not res!231899) (not e!242424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402492 (= res!231899 (validKeyInArray!0 k0!794))))

(declare-fun b!402493 () Bool)

(declare-fun res!231896 () Bool)

(assert (=> b!402493 (=> (not res!231896) (not e!242424))))

(declare-fun arrayContainsKey!0 (array!24139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402493 (= res!231896 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402494 () Bool)

(declare-fun res!231895 () Bool)

(assert (=> b!402494 (=> (not res!231895) (not e!242425))))

(assert (=> b!402494 (= res!231895 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11872 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402495 () Bool)

(declare-fun res!231892 () Bool)

(assert (=> b!402495 (=> (not res!231892) (not e!242424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402495 (= res!231892 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16815 () Bool)

(declare-fun tp!32864 () Bool)

(assert (=> mapNonEmpty!16815 (= mapRes!16815 (and tp!32864 e!242422))))

(declare-fun mapValue!16815 () ValueCell!4721)

(declare-fun mapKey!16815 () (_ BitVec 32))

(declare-fun mapRest!16815 () (Array (_ BitVec 32) ValueCell!4721))

(assert (=> mapNonEmpty!16815 (= (arr!11520 _values!549) (store mapRest!16815 mapKey!16815 mapValue!16815))))

(declare-fun e!242423 () Bool)

(declare-fun b!402496 () Bool)

(declare-fun call!28380 () ListLongMap!5673)

(declare-fun +!1155 (ListLongMap!5673 tuple2!6770) ListLongMap!5673)

(assert (=> b!402496 (= e!242423 (= call!28381 (+!1155 call!28380 (tuple2!6771 k0!794 v!412))))))

(declare-fun b!402497 () Bool)

(assert (=> b!402497 (= e!242423 (= call!28380 call!28381))))

(declare-fun b!402498 () Bool)

(assert (=> b!402498 (= e!242425 (not true))))

(assert (=> b!402498 e!242423))

(assert (=> b!402498 (= c!54756 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12160 0))(
  ( (Unit!12161) )
))
(declare-fun lt!187732 () Unit!12160)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!343 (array!24139 array!24141 (_ BitVec 32) (_ BitVec 32) V!14611 V!14611 (_ BitVec 32) (_ BitVec 64) V!14611 (_ BitVec 32) Int) Unit!12160)

(assert (=> b!402498 (= lt!187732 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!343 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!231894 () Bool)

(assert (=> start!38696 (=> (not res!231894) (not e!242424))))

(assert (=> start!38696 (= res!231894 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11872 _keys!709))))))

(assert (=> start!38696 e!242424))

(assert (=> start!38696 tp_is_empty!10129))

(assert (=> start!38696 tp!32865))

(assert (=> start!38696 true))

(declare-fun e!242426 () Bool)

(declare-fun array_inv!8448 (array!24141) Bool)

(assert (=> start!38696 (and (array_inv!8448 _values!549) e!242426)))

(declare-fun array_inv!8449 (array!24139) Bool)

(assert (=> start!38696 (array_inv!8449 _keys!709)))

(declare-fun bm!28378 () Bool)

(assert (=> bm!28378 (= call!28380 (getCurrentListMapNoExtraKeys!1068 (ite c!54756 _keys!709 lt!187733) (ite c!54756 _values!549 (array!24142 (store (arr!11520 _values!549) i!563 (ValueCellFull!4721 v!412)) (size!11873 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402499 () Bool)

(declare-fun res!231900 () Bool)

(assert (=> b!402499 (=> (not res!231900) (not e!242424))))

(assert (=> b!402499 (= res!231900 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11872 _keys!709))))))

(declare-fun b!402500 () Bool)

(assert (=> b!402500 (= e!242426 (and e!242421 mapRes!16815))))

(declare-fun condMapEmpty!16815 () Bool)

(declare-fun mapDefault!16815 () ValueCell!4721)

(assert (=> b!402500 (= condMapEmpty!16815 (= (arr!11520 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4721)) mapDefault!16815)))))

(declare-fun b!402501 () Bool)

(declare-fun res!231893 () Bool)

(assert (=> b!402501 (=> (not res!231893) (not e!242424))))

(assert (=> b!402501 (= res!231893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402502 () Bool)

(declare-fun res!231891 () Bool)

(assert (=> b!402502 (=> (not res!231891) (not e!242424))))

(assert (=> b!402502 (= res!231891 (or (= (select (arr!11519 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11519 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38696 res!231894) b!402495))

(assert (= (and b!402495 res!231892) b!402489))

(assert (= (and b!402489 res!231890) b!402501))

(assert (= (and b!402501 res!231893) b!402490))

(assert (= (and b!402490 res!231897) b!402499))

(assert (= (and b!402499 res!231900) b!402492))

(assert (= (and b!402492 res!231899) b!402502))

(assert (= (and b!402502 res!231891) b!402493))

(assert (= (and b!402493 res!231896) b!402487))

(assert (= (and b!402487 res!231889) b!402486))

(assert (= (and b!402486 res!231898) b!402494))

(assert (= (and b!402494 res!231895) b!402498))

(assert (= (and b!402498 c!54756) b!402496))

(assert (= (and b!402498 (not c!54756)) b!402497))

(assert (= (or b!402496 b!402497) bm!28377))

(assert (= (or b!402496 b!402497) bm!28378))

(assert (= (and b!402500 condMapEmpty!16815) mapIsEmpty!16815))

(assert (= (and b!402500 (not condMapEmpty!16815)) mapNonEmpty!16815))

(get-info :version)

(assert (= (and mapNonEmpty!16815 ((_ is ValueCellFull!4721) mapValue!16815)) b!402491))

(assert (= (and b!402500 ((_ is ValueCellFull!4721) mapDefault!16815)) b!402488))

(assert (= start!38696 b!402500))

(declare-fun m!395451 () Bool)

(assert (=> b!402487 m!395451))

(declare-fun m!395453 () Bool)

(assert (=> b!402487 m!395453))

(declare-fun m!395455 () Bool)

(assert (=> start!38696 m!395455))

(declare-fun m!395457 () Bool)

(assert (=> start!38696 m!395457))

(declare-fun m!395459 () Bool)

(assert (=> bm!28378 m!395459))

(declare-fun m!395461 () Bool)

(assert (=> bm!28378 m!395461))

(assert (=> bm!28377 m!395459))

(declare-fun m!395463 () Bool)

(assert (=> bm!28377 m!395463))

(declare-fun m!395465 () Bool)

(assert (=> b!402495 m!395465))

(declare-fun m!395467 () Bool)

(assert (=> b!402496 m!395467))

(declare-fun m!395469 () Bool)

(assert (=> b!402502 m!395469))

(declare-fun m!395471 () Bool)

(assert (=> mapNonEmpty!16815 m!395471))

(declare-fun m!395473 () Bool)

(assert (=> b!402498 m!395473))

(declare-fun m!395475 () Bool)

(assert (=> b!402492 m!395475))

(declare-fun m!395477 () Bool)

(assert (=> b!402501 m!395477))

(declare-fun m!395479 () Bool)

(assert (=> b!402486 m!395479))

(declare-fun m!395481 () Bool)

(assert (=> b!402490 m!395481))

(declare-fun m!395483 () Bool)

(assert (=> b!402493 m!395483))

(check-sat (not b!402492) b_and!16607 (not b!402501) (not bm!28378) (not b_next!9247) (not b!402495) tp_is_empty!10129 (not b!402487) (not b!402490) (not mapNonEmpty!16815) (not start!38696) (not b!402493) (not b!402498) (not bm!28377) (not b!402486) (not b!402496))
(check-sat b_and!16607 (not b_next!9247))
