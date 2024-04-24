; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37758 () Bool)

(assert start!37758)

(declare-fun b_free!8875 () Bool)

(declare-fun b_next!8875 () Bool)

(assert (=> start!37758 (= b_free!8875 (not b_next!8875))))

(declare-fun tp!31376 () Bool)

(declare-fun b_and!16131 () Bool)

(assert (=> start!37758 (= tp!31376 b_and!16131)))

(declare-fun b!387718 () Bool)

(declare-fun res!221631 () Bool)

(declare-fun e!235010 () Bool)

(assert (=> b!387718 (=> (not res!221631) (not e!235010))))

(declare-datatypes ((array!22974 0))(
  ( (array!22975 (arr!10955 (Array (_ BitVec 32) (_ BitVec 64))) (size!11307 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22974)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387718 (= res!221631 (or (= (select (arr!10955 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10955 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387719 () Bool)

(declare-fun res!221628 () Bool)

(assert (=> b!387719 (=> (not res!221628) (not e!235010))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22974 (_ BitVec 32)) Bool)

(assert (=> b!387719 (= res!221628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387720 () Bool)

(declare-fun res!221632 () Bool)

(declare-fun e!235014 () Bool)

(assert (=> b!387720 (=> (not res!221632) (not e!235014))))

(declare-fun lt!182132 () array!22974)

(declare-datatypes ((List!6189 0))(
  ( (Nil!6186) (Cons!6185 (h!7041 (_ BitVec 64)) (t!11331 List!6189)) )
))
(declare-fun arrayNoDuplicates!0 (array!22974 (_ BitVec 32) List!6189) Bool)

(assert (=> b!387720 (= res!221632 (arrayNoDuplicates!0 lt!182132 #b00000000000000000000000000000000 Nil!6186))))

(declare-fun res!221625 () Bool)

(assert (=> start!37758 (=> (not res!221625) (not e!235010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37758 (= res!221625 (validMask!0 mask!970))))

(assert (=> start!37758 e!235010))

(declare-datatypes ((V!13835 0))(
  ( (V!13836 (val!4818 Int)) )
))
(declare-datatypes ((ValueCell!4430 0))(
  ( (ValueCellFull!4430 (v!7016 V!13835)) (EmptyCell!4430) )
))
(declare-datatypes ((array!22976 0))(
  ( (array!22977 (arr!10956 (Array (_ BitVec 32) ValueCell!4430)) (size!11308 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22976)

(declare-fun e!235012 () Bool)

(declare-fun array_inv!8096 (array!22976) Bool)

(assert (=> start!37758 (and (array_inv!8096 _values!506) e!235012)))

(assert (=> start!37758 tp!31376))

(assert (=> start!37758 true))

(declare-fun tp_is_empty!9547 () Bool)

(assert (=> start!37758 tp_is_empty!9547))

(declare-fun array_inv!8097 (array!22974) Bool)

(assert (=> start!37758 (array_inv!8097 _keys!658)))

(declare-fun b!387721 () Bool)

(declare-fun res!221626 () Bool)

(assert (=> b!387721 (=> (not res!221626) (not e!235010))))

(assert (=> b!387721 (= res!221626 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11307 _keys!658))))))

(declare-fun b!387722 () Bool)

(declare-fun res!221627 () Bool)

(assert (=> b!387722 (=> (not res!221627) (not e!235010))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387722 (= res!221627 (validKeyInArray!0 k0!778))))

(declare-fun b!387723 () Bool)

(declare-fun e!235009 () Bool)

(assert (=> b!387723 (= e!235009 tp_is_empty!9547)))

(declare-fun b!387724 () Bool)

(declare-fun res!221630 () Bool)

(assert (=> b!387724 (=> (not res!221630) (not e!235010))))

(declare-fun arrayContainsKey!0 (array!22974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387724 (= res!221630 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387725 () Bool)

(assert (=> b!387725 (= e!235010 e!235014)))

(declare-fun res!221624 () Bool)

(assert (=> b!387725 (=> (not res!221624) (not e!235014))))

(assert (=> b!387725 (= res!221624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182132 mask!970))))

(assert (=> b!387725 (= lt!182132 (array!22975 (store (arr!10955 _keys!658) i!548 k0!778) (size!11307 _keys!658)))))

(declare-fun mapNonEmpty!15885 () Bool)

(declare-fun mapRes!15885 () Bool)

(declare-fun tp!31377 () Bool)

(assert (=> mapNonEmpty!15885 (= mapRes!15885 (and tp!31377 e!235009))))

(declare-fun mapValue!15885 () ValueCell!4430)

(declare-fun mapRest!15885 () (Array (_ BitVec 32) ValueCell!4430))

(declare-fun mapKey!15885 () (_ BitVec 32))

(assert (=> mapNonEmpty!15885 (= (arr!10956 _values!506) (store mapRest!15885 mapKey!15885 mapValue!15885))))

(declare-fun b!387726 () Bool)

(declare-fun res!221629 () Bool)

(assert (=> b!387726 (=> (not res!221629) (not e!235010))))

(assert (=> b!387726 (= res!221629 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6186))))

(declare-fun b!387727 () Bool)

(declare-fun e!235011 () Bool)

(assert (=> b!387727 (= e!235011 tp_is_empty!9547)))

(declare-fun b!387728 () Bool)

(assert (=> b!387728 (= e!235014 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6338 0))(
  ( (tuple2!6339 (_1!3180 (_ BitVec 64)) (_2!3180 V!13835)) )
))
(declare-datatypes ((List!6190 0))(
  ( (Nil!6187) (Cons!6186 (h!7042 tuple2!6338) (t!11332 List!6190)) )
))
(declare-datatypes ((ListLongMap!5253 0))(
  ( (ListLongMap!5254 (toList!2642 List!6190)) )
))
(declare-fun lt!182133 () ListLongMap!5253)

(declare-fun zeroValue!472 () V!13835)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13835)

(declare-fun minValue!472 () V!13835)

(declare-fun getCurrentListMapNoExtraKeys!917 (array!22974 array!22976 (_ BitVec 32) (_ BitVec 32) V!13835 V!13835 (_ BitVec 32) Int) ListLongMap!5253)

(assert (=> b!387728 (= lt!182133 (getCurrentListMapNoExtraKeys!917 lt!182132 (array!22977 (store (arr!10956 _values!506) i!548 (ValueCellFull!4430 v!373)) (size!11308 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182134 () ListLongMap!5253)

(assert (=> b!387728 (= lt!182134 (getCurrentListMapNoExtraKeys!917 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387729 () Bool)

(declare-fun res!221633 () Bool)

(assert (=> b!387729 (=> (not res!221633) (not e!235010))))

(assert (=> b!387729 (= res!221633 (and (= (size!11308 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11307 _keys!658) (size!11308 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15885 () Bool)

(assert (=> mapIsEmpty!15885 mapRes!15885))

(declare-fun b!387730 () Bool)

(assert (=> b!387730 (= e!235012 (and e!235011 mapRes!15885))))

(declare-fun condMapEmpty!15885 () Bool)

(declare-fun mapDefault!15885 () ValueCell!4430)

(assert (=> b!387730 (= condMapEmpty!15885 (= (arr!10956 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4430)) mapDefault!15885)))))

(assert (= (and start!37758 res!221625) b!387729))

(assert (= (and b!387729 res!221633) b!387719))

(assert (= (and b!387719 res!221628) b!387726))

(assert (= (and b!387726 res!221629) b!387721))

(assert (= (and b!387721 res!221626) b!387722))

(assert (= (and b!387722 res!221627) b!387718))

(assert (= (and b!387718 res!221631) b!387724))

(assert (= (and b!387724 res!221630) b!387725))

(assert (= (and b!387725 res!221624) b!387720))

(assert (= (and b!387720 res!221632) b!387728))

(assert (= (and b!387730 condMapEmpty!15885) mapIsEmpty!15885))

(assert (= (and b!387730 (not condMapEmpty!15885)) mapNonEmpty!15885))

(get-info :version)

(assert (= (and mapNonEmpty!15885 ((_ is ValueCellFull!4430) mapValue!15885)) b!387723))

(assert (= (and b!387730 ((_ is ValueCellFull!4430) mapDefault!15885)) b!387727))

(assert (= start!37758 b!387730))

(declare-fun m!384035 () Bool)

(assert (=> b!387724 m!384035))

(declare-fun m!384037 () Bool)

(assert (=> b!387728 m!384037))

(declare-fun m!384039 () Bool)

(assert (=> b!387728 m!384039))

(declare-fun m!384041 () Bool)

(assert (=> b!387728 m!384041))

(declare-fun m!384043 () Bool)

(assert (=> b!387725 m!384043))

(declare-fun m!384045 () Bool)

(assert (=> b!387725 m!384045))

(declare-fun m!384047 () Bool)

(assert (=> start!37758 m!384047))

(declare-fun m!384049 () Bool)

(assert (=> start!37758 m!384049))

(declare-fun m!384051 () Bool)

(assert (=> start!37758 m!384051))

(declare-fun m!384053 () Bool)

(assert (=> b!387719 m!384053))

(declare-fun m!384055 () Bool)

(assert (=> mapNonEmpty!15885 m!384055))

(declare-fun m!384057 () Bool)

(assert (=> b!387726 m!384057))

(declare-fun m!384059 () Bool)

(assert (=> b!387720 m!384059))

(declare-fun m!384061 () Bool)

(assert (=> b!387718 m!384061))

(declare-fun m!384063 () Bool)

(assert (=> b!387722 m!384063))

(check-sat (not b!387725) (not b!387720) b_and!16131 (not b!387724) (not b_next!8875) (not b!387719) (not mapNonEmpty!15885) (not start!37758) (not b!387726) (not b!387728) tp_is_empty!9547 (not b!387722))
(check-sat b_and!16131 (not b_next!8875))
