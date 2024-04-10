; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37714 () Bool)

(assert start!37714)

(declare-fun b_free!8817 () Bool)

(declare-fun b_next!8817 () Bool)

(assert (=> start!37714 (= b_free!8817 (not b_next!8817))))

(declare-fun tp!31203 () Bool)

(declare-fun b_and!16059 () Bool)

(assert (=> start!37714 (= tp!31203 b_and!16059)))

(declare-fun b!386636 () Bool)

(declare-fun res!220760 () Bool)

(declare-fun e!234519 () Bool)

(assert (=> b!386636 (=> (not res!220760) (not e!234519))))

(declare-datatypes ((array!22873 0))(
  ( (array!22874 (arr!10905 (Array (_ BitVec 32) (_ BitVec 64))) (size!11257 (_ BitVec 32))) )
))
(declare-fun lt!181854 () array!22873)

(declare-datatypes ((List!6286 0))(
  ( (Nil!6283) (Cons!6282 (h!7138 (_ BitVec 64)) (t!11436 List!6286)) )
))
(declare-fun arrayNoDuplicates!0 (array!22873 (_ BitVec 32) List!6286) Bool)

(assert (=> b!386636 (= res!220760 (arrayNoDuplicates!0 lt!181854 #b00000000000000000000000000000000 Nil!6283))))

(declare-fun b!386637 () Bool)

(declare-fun res!220763 () Bool)

(declare-fun e!234521 () Bool)

(assert (=> b!386637 (=> (not res!220763) (not e!234521))))

(declare-fun _keys!658 () array!22873)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386637 (= res!220763 (or (= (select (arr!10905 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10905 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386638 () Bool)

(declare-fun e!234524 () Bool)

(declare-fun tp_is_empty!9489 () Bool)

(assert (=> b!386638 (= e!234524 tp_is_empty!9489)))

(declare-fun b!386639 () Bool)

(assert (=> b!386639 (= e!234521 e!234519)))

(declare-fun res!220764 () Bool)

(assert (=> b!386639 (=> (not res!220764) (not e!234519))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22873 (_ BitVec 32)) Bool)

(assert (=> b!386639 (= res!220764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181854 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!386639 (= lt!181854 (array!22874 (store (arr!10905 _keys!658) i!548 k0!778) (size!11257 _keys!658)))))

(declare-fun b!386640 () Bool)

(declare-fun e!234520 () Bool)

(declare-fun mapRes!15798 () Bool)

(assert (=> b!386640 (= e!234520 (and e!234524 mapRes!15798))))

(declare-fun condMapEmpty!15798 () Bool)

(declare-datatypes ((V!13757 0))(
  ( (V!13758 (val!4789 Int)) )
))
(declare-datatypes ((ValueCell!4401 0))(
  ( (ValueCellFull!4401 (v!6986 V!13757)) (EmptyCell!4401) )
))
(declare-datatypes ((array!22875 0))(
  ( (array!22876 (arr!10906 (Array (_ BitVec 32) ValueCell!4401)) (size!11258 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22875)

(declare-fun mapDefault!15798 () ValueCell!4401)

(assert (=> b!386640 (= condMapEmpty!15798 (= (arr!10906 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4401)) mapDefault!15798)))))

(declare-fun b!386641 () Bool)

(declare-fun res!220757 () Bool)

(assert (=> b!386641 (=> (not res!220757) (not e!234521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386641 (= res!220757 (validKeyInArray!0 k0!778))))

(declare-fun b!386642 () Bool)

(assert (=> b!386642 (= e!234519 false)))

(declare-datatypes ((tuple2!6438 0))(
  ( (tuple2!6439 (_1!3230 (_ BitVec 64)) (_2!3230 V!13757)) )
))
(declare-datatypes ((List!6287 0))(
  ( (Nil!6284) (Cons!6283 (h!7139 tuple2!6438) (t!11437 List!6287)) )
))
(declare-datatypes ((ListLongMap!5351 0))(
  ( (ListLongMap!5352 (toList!2691 List!6287)) )
))
(declare-fun lt!181853 () ListLongMap!5351)

(declare-fun zeroValue!472 () V!13757)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13757)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13757)

(declare-fun getCurrentListMapNoExtraKeys!920 (array!22873 array!22875 (_ BitVec 32) (_ BitVec 32) V!13757 V!13757 (_ BitVec 32) Int) ListLongMap!5351)

(assert (=> b!386642 (= lt!181853 (getCurrentListMapNoExtraKeys!920 lt!181854 (array!22876 (store (arr!10906 _values!506) i!548 (ValueCellFull!4401 v!373)) (size!11258 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181852 () ListLongMap!5351)

(assert (=> b!386642 (= lt!181852 (getCurrentListMapNoExtraKeys!920 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!220759 () Bool)

(assert (=> start!37714 (=> (not res!220759) (not e!234521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37714 (= res!220759 (validMask!0 mask!970))))

(assert (=> start!37714 e!234521))

(declare-fun array_inv!8022 (array!22875) Bool)

(assert (=> start!37714 (and (array_inv!8022 _values!506) e!234520)))

(assert (=> start!37714 tp!31203))

(assert (=> start!37714 true))

(assert (=> start!37714 tp_is_empty!9489))

(declare-fun array_inv!8023 (array!22873) Bool)

(assert (=> start!37714 (array_inv!8023 _keys!658)))

(declare-fun b!386643 () Bool)

(declare-fun res!220766 () Bool)

(assert (=> b!386643 (=> (not res!220766) (not e!234521))))

(assert (=> b!386643 (= res!220766 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11257 _keys!658))))))

(declare-fun mapIsEmpty!15798 () Bool)

(assert (=> mapIsEmpty!15798 mapRes!15798))

(declare-fun b!386644 () Bool)

(declare-fun res!220762 () Bool)

(assert (=> b!386644 (=> (not res!220762) (not e!234521))))

(assert (=> b!386644 (= res!220762 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6283))))

(declare-fun b!386645 () Bool)

(declare-fun e!234523 () Bool)

(assert (=> b!386645 (= e!234523 tp_is_empty!9489)))

(declare-fun b!386646 () Bool)

(declare-fun res!220758 () Bool)

(assert (=> b!386646 (=> (not res!220758) (not e!234521))))

(assert (=> b!386646 (= res!220758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386647 () Bool)

(declare-fun res!220761 () Bool)

(assert (=> b!386647 (=> (not res!220761) (not e!234521))))

(declare-fun arrayContainsKey!0 (array!22873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386647 (= res!220761 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15798 () Bool)

(declare-fun tp!31202 () Bool)

(assert (=> mapNonEmpty!15798 (= mapRes!15798 (and tp!31202 e!234523))))

(declare-fun mapRest!15798 () (Array (_ BitVec 32) ValueCell!4401))

(declare-fun mapValue!15798 () ValueCell!4401)

(declare-fun mapKey!15798 () (_ BitVec 32))

(assert (=> mapNonEmpty!15798 (= (arr!10906 _values!506) (store mapRest!15798 mapKey!15798 mapValue!15798))))

(declare-fun b!386648 () Bool)

(declare-fun res!220765 () Bool)

(assert (=> b!386648 (=> (not res!220765) (not e!234521))))

(assert (=> b!386648 (= res!220765 (and (= (size!11258 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11257 _keys!658) (size!11258 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37714 res!220759) b!386648))

(assert (= (and b!386648 res!220765) b!386646))

(assert (= (and b!386646 res!220758) b!386644))

(assert (= (and b!386644 res!220762) b!386643))

(assert (= (and b!386643 res!220766) b!386641))

(assert (= (and b!386641 res!220757) b!386637))

(assert (= (and b!386637 res!220763) b!386647))

(assert (= (and b!386647 res!220761) b!386639))

(assert (= (and b!386639 res!220764) b!386636))

(assert (= (and b!386636 res!220760) b!386642))

(assert (= (and b!386640 condMapEmpty!15798) mapIsEmpty!15798))

(assert (= (and b!386640 (not condMapEmpty!15798)) mapNonEmpty!15798))

(get-info :version)

(assert (= (and mapNonEmpty!15798 ((_ is ValueCellFull!4401) mapValue!15798)) b!386645))

(assert (= (and b!386640 ((_ is ValueCellFull!4401) mapDefault!15798)) b!386638))

(assert (= start!37714 b!386640))

(declare-fun m!382935 () Bool)

(assert (=> b!386647 m!382935))

(declare-fun m!382937 () Bool)

(assert (=> b!386636 m!382937))

(declare-fun m!382939 () Bool)

(assert (=> start!37714 m!382939))

(declare-fun m!382941 () Bool)

(assert (=> start!37714 m!382941))

(declare-fun m!382943 () Bool)

(assert (=> start!37714 m!382943))

(declare-fun m!382945 () Bool)

(assert (=> b!386646 m!382945))

(declare-fun m!382947 () Bool)

(assert (=> b!386641 m!382947))

(declare-fun m!382949 () Bool)

(assert (=> b!386642 m!382949))

(declare-fun m!382951 () Bool)

(assert (=> b!386642 m!382951))

(declare-fun m!382953 () Bool)

(assert (=> b!386642 m!382953))

(declare-fun m!382955 () Bool)

(assert (=> b!386637 m!382955))

(declare-fun m!382957 () Bool)

(assert (=> b!386644 m!382957))

(declare-fun m!382959 () Bool)

(assert (=> mapNonEmpty!15798 m!382959))

(declare-fun m!382961 () Bool)

(assert (=> b!386639 m!382961))

(declare-fun m!382963 () Bool)

(assert (=> b!386639 m!382963))

(check-sat (not b!386644) (not b!386641) (not b!386639) tp_is_empty!9489 (not start!37714) (not b!386646) (not b!386647) (not b!386636) (not b!386642) (not b_next!8817) b_and!16059 (not mapNonEmpty!15798))
(check-sat b_and!16059 (not b_next!8817))
