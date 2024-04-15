; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40554 () Bool)

(assert start!40554)

(declare-fun b_free!10579 () Bool)

(declare-fun b_next!10579 () Bool)

(assert (=> start!40554 (= b_free!10579 (not b_next!10579))))

(declare-fun tp!37556 () Bool)

(declare-fun b_and!18561 () Bool)

(assert (=> start!40554 (= tp!37556 b_and!18561)))

(declare-fun mapIsEmpty!19509 () Bool)

(declare-fun mapRes!19509 () Bool)

(assert (=> mapIsEmpty!19509 mapRes!19509))

(declare-fun b!446926 () Bool)

(declare-fun res!265414 () Bool)

(declare-fun e!262456 () Bool)

(assert (=> b!446926 (=> (not res!265414) (not e!262456))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27645 0))(
  ( (array!27646 (arr!13268 (Array (_ BitVec 32) (_ BitVec 64))) (size!13621 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27645)

(assert (=> b!446926 (= res!265414 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13621 _keys!709))))))

(declare-fun b!446927 () Bool)

(declare-fun res!265419 () Bool)

(declare-fun e!262457 () Bool)

(assert (=> b!446927 (=> (not res!265419) (not e!262457))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!446927 (= res!265419 (bvsle from!863 i!563))))

(declare-fun b!446928 () Bool)

(declare-datatypes ((V!16995 0))(
  ( (V!16996 (val!6003 Int)) )
))
(declare-datatypes ((ValueCell!5615 0))(
  ( (ValueCellFull!5615 (v!8252 V!16995)) (EmptyCell!5615) )
))
(declare-datatypes ((array!27647 0))(
  ( (array!27648 (arr!13269 (Array (_ BitVec 32) ValueCell!5615)) (size!13622 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27647)

(assert (=> b!446928 (= e!262457 (bvsge i!563 (size!13622 _values!549)))))

(declare-fun minValue!515 () V!16995)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7884 0))(
  ( (tuple2!7885 (_1!3953 (_ BitVec 64)) (_2!3953 V!16995)) )
))
(declare-datatypes ((List!7943 0))(
  ( (Nil!7940) (Cons!7939 (h!8795 tuple2!7884) (t!13696 List!7943)) )
))
(declare-datatypes ((ListLongMap!6787 0))(
  ( (ListLongMap!6788 (toList!3409 List!7943)) )
))
(declare-fun lt!203691 () ListLongMap!6787)

(declare-fun zeroValue!515 () V!16995)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1607 (array!27645 array!27647 (_ BitVec 32) (_ BitVec 32) V!16995 V!16995 (_ BitVec 32) Int) ListLongMap!6787)

(assert (=> b!446928 (= lt!203691 (getCurrentListMapNoExtraKeys!1607 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!446929 () Bool)

(declare-fun e!262458 () Bool)

(declare-fun tp_is_empty!11917 () Bool)

(assert (=> b!446929 (= e!262458 tp_is_empty!11917)))

(declare-fun b!446930 () Bool)

(declare-fun e!262459 () Bool)

(assert (=> b!446930 (= e!262459 tp_is_empty!11917)))

(declare-fun b!446931 () Bool)

(declare-fun res!265421 () Bool)

(assert (=> b!446931 (=> (not res!265421) (not e!262456))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446931 (= res!265421 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446932 () Bool)

(declare-fun res!265417 () Bool)

(assert (=> b!446932 (=> (not res!265417) (not e!262456))))

(assert (=> b!446932 (= res!265417 (or (= (select (arr!13268 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13268 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19509 () Bool)

(declare-fun tp!37557 () Bool)

(assert (=> mapNonEmpty!19509 (= mapRes!19509 (and tp!37557 e!262459))))

(declare-fun mapRest!19509 () (Array (_ BitVec 32) ValueCell!5615))

(declare-fun mapValue!19509 () ValueCell!5615)

(declare-fun mapKey!19509 () (_ BitVec 32))

(assert (=> mapNonEmpty!19509 (= (arr!13269 _values!549) (store mapRest!19509 mapKey!19509 mapValue!19509))))

(declare-fun b!446933 () Bool)

(assert (=> b!446933 (= e!262456 e!262457)))

(declare-fun res!265418 () Bool)

(assert (=> b!446933 (=> (not res!265418) (not e!262457))))

(declare-fun lt!203690 () array!27645)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27645 (_ BitVec 32)) Bool)

(assert (=> b!446933 (= res!265418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203690 mask!1025))))

(assert (=> b!446933 (= lt!203690 (array!27646 (store (arr!13268 _keys!709) i!563 k0!794) (size!13621 _keys!709)))))

(declare-fun b!446934 () Bool)

(declare-fun res!265416 () Bool)

(assert (=> b!446934 (=> (not res!265416) (not e!262456))))

(assert (=> b!446934 (= res!265416 (and (= (size!13622 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13621 _keys!709) (size!13622 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446935 () Bool)

(declare-fun res!265412 () Bool)

(assert (=> b!446935 (=> (not res!265412) (not e!262456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446935 (= res!265412 (validMask!0 mask!1025))))

(declare-fun res!265422 () Bool)

(assert (=> start!40554 (=> (not res!265422) (not e!262456))))

(assert (=> start!40554 (= res!265422 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13621 _keys!709))))))

(assert (=> start!40554 e!262456))

(assert (=> start!40554 tp_is_empty!11917))

(assert (=> start!40554 tp!37556))

(assert (=> start!40554 true))

(declare-fun e!262455 () Bool)

(declare-fun array_inv!9672 (array!27647) Bool)

(assert (=> start!40554 (and (array_inv!9672 _values!549) e!262455)))

(declare-fun array_inv!9673 (array!27645) Bool)

(assert (=> start!40554 (array_inv!9673 _keys!709)))

(declare-fun b!446936 () Bool)

(assert (=> b!446936 (= e!262455 (and e!262458 mapRes!19509))))

(declare-fun condMapEmpty!19509 () Bool)

(declare-fun mapDefault!19509 () ValueCell!5615)

(assert (=> b!446936 (= condMapEmpty!19509 (= (arr!13269 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5615)) mapDefault!19509)))))

(declare-fun b!446937 () Bool)

(declare-fun res!265411 () Bool)

(assert (=> b!446937 (=> (not res!265411) (not e!262457))))

(declare-datatypes ((List!7944 0))(
  ( (Nil!7941) (Cons!7940 (h!8796 (_ BitVec 64)) (t!13697 List!7944)) )
))
(declare-fun arrayNoDuplicates!0 (array!27645 (_ BitVec 32) List!7944) Bool)

(assert (=> b!446937 (= res!265411 (arrayNoDuplicates!0 lt!203690 #b00000000000000000000000000000000 Nil!7941))))

(declare-fun b!446938 () Bool)

(declare-fun res!265420 () Bool)

(assert (=> b!446938 (=> (not res!265420) (not e!262456))))

(assert (=> b!446938 (= res!265420 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7941))))

(declare-fun b!446939 () Bool)

(declare-fun res!265413 () Bool)

(assert (=> b!446939 (=> (not res!265413) (not e!262456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446939 (= res!265413 (validKeyInArray!0 k0!794))))

(declare-fun b!446940 () Bool)

(declare-fun res!265415 () Bool)

(assert (=> b!446940 (=> (not res!265415) (not e!262456))))

(assert (=> b!446940 (= res!265415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40554 res!265422) b!446935))

(assert (= (and b!446935 res!265412) b!446934))

(assert (= (and b!446934 res!265416) b!446940))

(assert (= (and b!446940 res!265415) b!446938))

(assert (= (and b!446938 res!265420) b!446926))

(assert (= (and b!446926 res!265414) b!446939))

(assert (= (and b!446939 res!265413) b!446932))

(assert (= (and b!446932 res!265417) b!446931))

(assert (= (and b!446931 res!265421) b!446933))

(assert (= (and b!446933 res!265418) b!446937))

(assert (= (and b!446937 res!265411) b!446927))

(assert (= (and b!446927 res!265419) b!446928))

(assert (= (and b!446936 condMapEmpty!19509) mapIsEmpty!19509))

(assert (= (and b!446936 (not condMapEmpty!19509)) mapNonEmpty!19509))

(get-info :version)

(assert (= (and mapNonEmpty!19509 ((_ is ValueCellFull!5615) mapValue!19509)) b!446930))

(assert (= (and b!446936 ((_ is ValueCellFull!5615) mapDefault!19509)) b!446929))

(assert (= start!40554 b!446936))

(declare-fun m!431443 () Bool)

(assert (=> b!446940 m!431443))

(declare-fun m!431445 () Bool)

(assert (=> b!446938 m!431445))

(declare-fun m!431447 () Bool)

(assert (=> b!446939 m!431447))

(declare-fun m!431449 () Bool)

(assert (=> b!446937 m!431449))

(declare-fun m!431451 () Bool)

(assert (=> b!446933 m!431451))

(declare-fun m!431453 () Bool)

(assert (=> b!446933 m!431453))

(declare-fun m!431455 () Bool)

(assert (=> mapNonEmpty!19509 m!431455))

(declare-fun m!431457 () Bool)

(assert (=> b!446935 m!431457))

(declare-fun m!431459 () Bool)

(assert (=> b!446931 m!431459))

(declare-fun m!431461 () Bool)

(assert (=> start!40554 m!431461))

(declare-fun m!431463 () Bool)

(assert (=> start!40554 m!431463))

(declare-fun m!431465 () Bool)

(assert (=> b!446928 m!431465))

(declare-fun m!431467 () Bool)

(assert (=> b!446932 m!431467))

(check-sat (not b!446937) (not b_next!10579) (not b!446931) (not b!446935) (not b!446928) tp_is_empty!11917 (not b!446938) (not start!40554) (not b!446933) (not mapNonEmpty!19509) b_and!18561 (not b!446940) (not b!446939))
(check-sat b_and!18561 (not b_next!10579))
