; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37596 () Bool)

(assert start!37596)

(declare-fun b_free!8737 () Bool)

(declare-fun b_next!8737 () Bool)

(assert (=> start!37596 (= b_free!8737 (not b_next!8737))))

(declare-fun tp!30926 () Bool)

(declare-fun b_and!15953 () Bool)

(assert (=> start!37596 (= tp!30926 b_and!15953)))

(declare-fun b!384492 () Bool)

(declare-fun res!219223 () Bool)

(declare-fun e!233397 () Bool)

(assert (=> b!384492 (=> (not res!219223) (not e!233397))))

(declare-datatypes ((array!22659 0))(
  ( (array!22660 (arr!10798 (Array (_ BitVec 32) (_ BitVec 64))) (size!11151 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22659)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384492 (= res!219223 (or (= (select (arr!10798 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10798 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384493 () Bool)

(declare-fun e!233394 () Bool)

(declare-fun tp_is_empty!9385 () Bool)

(assert (=> b!384493 (= e!233394 tp_is_empty!9385)))

(declare-fun b!384494 () Bool)

(declare-fun res!219230 () Bool)

(assert (=> b!384494 (=> (not res!219230) (not e!233397))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384494 (= res!219230 (validKeyInArray!0 k0!778))))

(declare-fun b!384495 () Bool)

(declare-fun e!233399 () Bool)

(declare-fun mapRes!15642 () Bool)

(assert (=> b!384495 (= e!233399 (and e!233394 mapRes!15642))))

(declare-fun condMapEmpty!15642 () Bool)

(declare-datatypes ((V!13619 0))(
  ( (V!13620 (val!4737 Int)) )
))
(declare-datatypes ((ValueCell!4349 0))(
  ( (ValueCellFull!4349 (v!6928 V!13619)) (EmptyCell!4349) )
))
(declare-datatypes ((array!22661 0))(
  ( (array!22662 (arr!10799 (Array (_ BitVec 32) ValueCell!4349)) (size!11152 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22661)

(declare-fun mapDefault!15642 () ValueCell!4349)

(assert (=> b!384495 (= condMapEmpty!15642 (= (arr!10799 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4349)) mapDefault!15642)))))

(declare-fun mapNonEmpty!15642 () Bool)

(declare-fun tp!30927 () Bool)

(declare-fun e!233393 () Bool)

(assert (=> mapNonEmpty!15642 (= mapRes!15642 (and tp!30927 e!233393))))

(declare-fun mapValue!15642 () ValueCell!4349)

(declare-fun mapKey!15642 () (_ BitVec 32))

(declare-fun mapRest!15642 () (Array (_ BitVec 32) ValueCell!4349))

(assert (=> mapNonEmpty!15642 (= (arr!10799 _values!506) (store mapRest!15642 mapKey!15642 mapValue!15642))))

(declare-fun b!384496 () Bool)

(declare-fun e!233398 () Bool)

(assert (=> b!384496 (= e!233397 e!233398)))

(declare-fun res!219226 () Bool)

(assert (=> b!384496 (=> (not res!219226) (not e!233398))))

(declare-fun lt!180909 () array!22659)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22659 (_ BitVec 32)) Bool)

(assert (=> b!384496 (= res!219226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180909 mask!970))))

(assert (=> b!384496 (= lt!180909 (array!22660 (store (arr!10798 _keys!658) i!548 k0!778) (size!11151 _keys!658)))))

(declare-fun mapIsEmpty!15642 () Bool)

(assert (=> mapIsEmpty!15642 mapRes!15642))

(declare-fun b!384497 () Bool)

(declare-fun res!219233 () Bool)

(assert (=> b!384497 (=> (not res!219233) (not e!233397))))

(assert (=> b!384497 (= res!219233 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11151 _keys!658))))))

(declare-fun b!384498 () Bool)

(declare-fun res!219232 () Bool)

(assert (=> b!384498 (=> (not res!219232) (not e!233397))))

(assert (=> b!384498 (= res!219232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384499 () Bool)

(assert (=> b!384499 (= e!233393 tp_is_empty!9385)))

(declare-fun b!384500 () Bool)

(declare-fun res!219229 () Bool)

(assert (=> b!384500 (=> (not res!219229) (not e!233398))))

(declare-datatypes ((List!6183 0))(
  ( (Nil!6180) (Cons!6179 (h!7035 (_ BitVec 64)) (t!11324 List!6183)) )
))
(declare-fun arrayNoDuplicates!0 (array!22659 (_ BitVec 32) List!6183) Bool)

(assert (=> b!384500 (= res!219229 (arrayNoDuplicates!0 lt!180909 #b00000000000000000000000000000000 Nil!6180))))

(declare-fun b!384501 () Bool)

(declare-fun e!233396 () Bool)

(assert (=> b!384501 (= e!233396 true)))

(declare-datatypes ((tuple2!6360 0))(
  ( (tuple2!6361 (_1!3191 (_ BitVec 64)) (_2!3191 V!13619)) )
))
(declare-datatypes ((List!6184 0))(
  ( (Nil!6181) (Cons!6180 (h!7036 tuple2!6360) (t!11325 List!6184)) )
))
(declare-datatypes ((ListLongMap!5263 0))(
  ( (ListLongMap!5264 (toList!2647 List!6184)) )
))
(declare-fun lt!180910 () ListLongMap!5263)

(declare-fun lt!180911 () ListLongMap!5263)

(declare-fun lt!180912 () tuple2!6360)

(declare-fun +!1004 (ListLongMap!5263 tuple2!6360) ListLongMap!5263)

(assert (=> b!384501 (= lt!180910 (+!1004 lt!180911 lt!180912))))

(declare-fun lt!180906 () ListLongMap!5263)

(declare-fun lt!180913 () ListLongMap!5263)

(assert (=> b!384501 (= lt!180906 lt!180913)))

(declare-fun b!384502 () Bool)

(declare-fun res!219231 () Bool)

(assert (=> b!384502 (=> (not res!219231) (not e!233397))))

(assert (=> b!384502 (= res!219231 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6180))))

(declare-fun res!219227 () Bool)

(assert (=> start!37596 (=> (not res!219227) (not e!233397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37596 (= res!219227 (validMask!0 mask!970))))

(assert (=> start!37596 e!233397))

(declare-fun array_inv!7950 (array!22661) Bool)

(assert (=> start!37596 (and (array_inv!7950 _values!506) e!233399)))

(assert (=> start!37596 tp!30926))

(assert (=> start!37596 true))

(assert (=> start!37596 tp_is_empty!9385))

(declare-fun array_inv!7951 (array!22659) Bool)

(assert (=> start!37596 (array_inv!7951 _keys!658)))

(declare-fun b!384503 () Bool)

(declare-fun res!219228 () Bool)

(assert (=> b!384503 (=> (not res!219228) (not e!233397))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384503 (= res!219228 (and (= (size!11152 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11151 _keys!658) (size!11152 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384504 () Bool)

(assert (=> b!384504 (= e!233398 (not e!233396))))

(declare-fun res!219224 () Bool)

(assert (=> b!384504 (=> res!219224 e!233396)))

(declare-fun lt!180905 () Bool)

(assert (=> b!384504 (= res!219224 (or (and (not lt!180905) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180905) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180905)))))

(assert (=> b!384504 (= lt!180905 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!472 () V!13619)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13619)

(declare-fun getCurrentListMap!2024 (array!22659 array!22661 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) Int) ListLongMap!5263)

(assert (=> b!384504 (= lt!180911 (getCurrentListMap!2024 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180908 () array!22661)

(assert (=> b!384504 (= lt!180906 (getCurrentListMap!2024 lt!180909 lt!180908 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180907 () ListLongMap!5263)

(assert (=> b!384504 (and (= lt!180913 lt!180907) (= lt!180907 lt!180913))))

(declare-fun lt!180915 () ListLongMap!5263)

(assert (=> b!384504 (= lt!180907 (+!1004 lt!180915 lt!180912))))

(declare-fun v!373 () V!13619)

(assert (=> b!384504 (= lt!180912 (tuple2!6361 k0!778 v!373))))

(declare-datatypes ((Unit!11854 0))(
  ( (Unit!11855) )
))
(declare-fun lt!180914 () Unit!11854)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!217 (array!22659 array!22661 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) (_ BitVec 64) V!13619 (_ BitVec 32) Int) Unit!11854)

(assert (=> b!384504 (= lt!180914 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!217 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!889 (array!22659 array!22661 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) Int) ListLongMap!5263)

(assert (=> b!384504 (= lt!180913 (getCurrentListMapNoExtraKeys!889 lt!180909 lt!180908 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384504 (= lt!180908 (array!22662 (store (arr!10799 _values!506) i!548 (ValueCellFull!4349 v!373)) (size!11152 _values!506)))))

(assert (=> b!384504 (= lt!180915 (getCurrentListMapNoExtraKeys!889 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384505 () Bool)

(declare-fun res!219225 () Bool)

(assert (=> b!384505 (=> (not res!219225) (not e!233397))))

(declare-fun arrayContainsKey!0 (array!22659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384505 (= res!219225 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37596 res!219227) b!384503))

(assert (= (and b!384503 res!219228) b!384498))

(assert (= (and b!384498 res!219232) b!384502))

(assert (= (and b!384502 res!219231) b!384497))

(assert (= (and b!384497 res!219233) b!384494))

(assert (= (and b!384494 res!219230) b!384492))

(assert (= (and b!384492 res!219223) b!384505))

(assert (= (and b!384505 res!219225) b!384496))

(assert (= (and b!384496 res!219226) b!384500))

(assert (= (and b!384500 res!219229) b!384504))

(assert (= (and b!384504 (not res!219224)) b!384501))

(assert (= (and b!384495 condMapEmpty!15642) mapIsEmpty!15642))

(assert (= (and b!384495 (not condMapEmpty!15642)) mapNonEmpty!15642))

(get-info :version)

(assert (= (and mapNonEmpty!15642 ((_ is ValueCellFull!4349) mapValue!15642)) b!384499))

(assert (= (and b!384495 ((_ is ValueCellFull!4349) mapDefault!15642)) b!384493))

(assert (= start!37596 b!384495))

(declare-fun m!380711 () Bool)

(assert (=> b!384501 m!380711))

(declare-fun m!380713 () Bool)

(assert (=> b!384505 m!380713))

(declare-fun m!380715 () Bool)

(assert (=> mapNonEmpty!15642 m!380715))

(declare-fun m!380717 () Bool)

(assert (=> b!384498 m!380717))

(declare-fun m!380719 () Bool)

(assert (=> b!384502 m!380719))

(declare-fun m!380721 () Bool)

(assert (=> start!37596 m!380721))

(declare-fun m!380723 () Bool)

(assert (=> start!37596 m!380723))

(declare-fun m!380725 () Bool)

(assert (=> start!37596 m!380725))

(declare-fun m!380727 () Bool)

(assert (=> b!384500 m!380727))

(declare-fun m!380729 () Bool)

(assert (=> b!384504 m!380729))

(declare-fun m!380731 () Bool)

(assert (=> b!384504 m!380731))

(declare-fun m!380733 () Bool)

(assert (=> b!384504 m!380733))

(declare-fun m!380735 () Bool)

(assert (=> b!384504 m!380735))

(declare-fun m!380737 () Bool)

(assert (=> b!384504 m!380737))

(declare-fun m!380739 () Bool)

(assert (=> b!384504 m!380739))

(declare-fun m!380741 () Bool)

(assert (=> b!384504 m!380741))

(declare-fun m!380743 () Bool)

(assert (=> b!384492 m!380743))

(declare-fun m!380745 () Bool)

(assert (=> b!384496 m!380745))

(declare-fun m!380747 () Bool)

(assert (=> b!384496 m!380747))

(declare-fun m!380749 () Bool)

(assert (=> b!384494 m!380749))

(check-sat b_and!15953 (not b!384498) tp_is_empty!9385 (not b!384500) (not b!384496) (not b!384494) (not b_next!8737) (not start!37596) (not b!384501) (not mapNonEmpty!15642) (not b!384505) (not b!384504) (not b!384502))
(check-sat b_and!15953 (not b_next!8737))
