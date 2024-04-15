; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37758 () Bool)

(assert start!37758)

(declare-fun b_free!8875 () Bool)

(declare-fun b_next!8875 () Bool)

(assert (=> start!37758 (= b_free!8875 (not b_next!8875))))

(declare-fun tp!31377 () Bool)

(declare-fun b_and!16091 () Bool)

(assert (=> start!37758 (= tp!31377 b_and!16091)))

(declare-fun mapNonEmpty!15885 () Bool)

(declare-fun mapRes!15885 () Bool)

(declare-fun tp!31376 () Bool)

(declare-fun e!234869 () Bool)

(assert (=> mapNonEmpty!15885 (= mapRes!15885 (and tp!31376 e!234869))))

(declare-datatypes ((V!13835 0))(
  ( (V!13836 (val!4818 Int)) )
))
(declare-datatypes ((ValueCell!4430 0))(
  ( (ValueCellFull!4430 (v!7009 V!13835)) (EmptyCell!4430) )
))
(declare-datatypes ((array!22973 0))(
  ( (array!22974 (arr!10955 (Array (_ BitVec 32) ValueCell!4430)) (size!11308 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22973)

(declare-fun mapRest!15885 () (Array (_ BitVec 32) ValueCell!4430))

(declare-fun mapKey!15885 () (_ BitVec 32))

(declare-fun mapValue!15885 () ValueCell!4430)

(assert (=> mapNonEmpty!15885 (= (arr!10955 _values!506) (store mapRest!15885 mapKey!15885 mapValue!15885))))

(declare-fun b!387496 () Bool)

(declare-fun e!234872 () Bool)

(declare-fun e!234871 () Bool)

(assert (=> b!387496 (= e!234872 e!234871)))

(declare-fun res!221505 () Bool)

(assert (=> b!387496 (=> (not res!221505) (not e!234871))))

(declare-datatypes ((array!22975 0))(
  ( (array!22976 (arr!10956 (Array (_ BitVec 32) (_ BitVec 64))) (size!11309 (_ BitVec 32))) )
))
(declare-fun lt!181880 () array!22975)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22975 (_ BitVec 32)) Bool)

(assert (=> b!387496 (= res!221505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181880 mask!970))))

(declare-fun _keys!658 () array!22975)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!387496 (= lt!181880 (array!22976 (store (arr!10956 _keys!658) i!548 k0!778) (size!11309 _keys!658)))))

(declare-fun b!387497 () Bool)

(assert (=> b!387497 (= e!234871 false)))

(declare-datatypes ((tuple2!6452 0))(
  ( (tuple2!6453 (_1!3237 (_ BitVec 64)) (_2!3237 V!13835)) )
))
(declare-datatypes ((List!6294 0))(
  ( (Nil!6291) (Cons!6290 (h!7146 tuple2!6452) (t!11435 List!6294)) )
))
(declare-datatypes ((ListLongMap!5355 0))(
  ( (ListLongMap!5356 (toList!2693 List!6294)) )
))
(declare-fun lt!181881 () ListLongMap!5355)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13835)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13835)

(declare-fun minValue!472 () V!13835)

(declare-fun getCurrentListMapNoExtraKeys!933 (array!22975 array!22973 (_ BitVec 32) (_ BitVec 32) V!13835 V!13835 (_ BitVec 32) Int) ListLongMap!5355)

(assert (=> b!387497 (= lt!181881 (getCurrentListMapNoExtraKeys!933 lt!181880 (array!22974 (store (arr!10955 _values!506) i!548 (ValueCellFull!4430 v!373)) (size!11308 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181879 () ListLongMap!5355)

(assert (=> b!387497 (= lt!181879 (getCurrentListMapNoExtraKeys!933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387498 () Bool)

(declare-fun res!221501 () Bool)

(assert (=> b!387498 (=> (not res!221501) (not e!234872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387498 (= res!221501 (validKeyInArray!0 k0!778))))

(declare-fun res!221506 () Bool)

(assert (=> start!37758 (=> (not res!221506) (not e!234872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37758 (= res!221506 (validMask!0 mask!970))))

(assert (=> start!37758 e!234872))

(declare-fun e!234870 () Bool)

(declare-fun array_inv!8058 (array!22973) Bool)

(assert (=> start!37758 (and (array_inv!8058 _values!506) e!234870)))

(assert (=> start!37758 tp!31377))

(assert (=> start!37758 true))

(declare-fun tp_is_empty!9547 () Bool)

(assert (=> start!37758 tp_is_empty!9547))

(declare-fun array_inv!8059 (array!22975) Bool)

(assert (=> start!37758 (array_inv!8059 _keys!658)))

(declare-fun b!387499 () Bool)

(declare-fun res!221502 () Bool)

(assert (=> b!387499 (=> (not res!221502) (not e!234872))))

(assert (=> b!387499 (= res!221502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387500 () Bool)

(declare-fun res!221500 () Bool)

(assert (=> b!387500 (=> (not res!221500) (not e!234872))))

(declare-datatypes ((List!6295 0))(
  ( (Nil!6292) (Cons!6291 (h!7147 (_ BitVec 64)) (t!11436 List!6295)) )
))
(declare-fun arrayNoDuplicates!0 (array!22975 (_ BitVec 32) List!6295) Bool)

(assert (=> b!387500 (= res!221500 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6292))))

(declare-fun b!387501 () Bool)

(declare-fun res!221507 () Bool)

(assert (=> b!387501 (=> (not res!221507) (not e!234871))))

(assert (=> b!387501 (= res!221507 (arrayNoDuplicates!0 lt!181880 #b00000000000000000000000000000000 Nil!6292))))

(declare-fun b!387502 () Bool)

(declare-fun e!234867 () Bool)

(assert (=> b!387502 (= e!234867 tp_is_empty!9547)))

(declare-fun mapIsEmpty!15885 () Bool)

(assert (=> mapIsEmpty!15885 mapRes!15885))

(declare-fun b!387503 () Bool)

(assert (=> b!387503 (= e!234869 tp_is_empty!9547)))

(declare-fun b!387504 () Bool)

(declare-fun res!221504 () Bool)

(assert (=> b!387504 (=> (not res!221504) (not e!234872))))

(assert (=> b!387504 (= res!221504 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11309 _keys!658))))))

(declare-fun b!387505 () Bool)

(declare-fun res!221499 () Bool)

(assert (=> b!387505 (=> (not res!221499) (not e!234872))))

(declare-fun arrayContainsKey!0 (array!22975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387505 (= res!221499 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387506 () Bool)

(assert (=> b!387506 (= e!234870 (and e!234867 mapRes!15885))))

(declare-fun condMapEmpty!15885 () Bool)

(declare-fun mapDefault!15885 () ValueCell!4430)

(assert (=> b!387506 (= condMapEmpty!15885 (= (arr!10955 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4430)) mapDefault!15885)))))

(declare-fun b!387507 () Bool)

(declare-fun res!221498 () Bool)

(assert (=> b!387507 (=> (not res!221498) (not e!234872))))

(assert (=> b!387507 (= res!221498 (and (= (size!11308 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11309 _keys!658) (size!11308 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387508 () Bool)

(declare-fun res!221503 () Bool)

(assert (=> b!387508 (=> (not res!221503) (not e!234872))))

(assert (=> b!387508 (= res!221503 (or (= (select (arr!10956 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10956 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37758 res!221506) b!387507))

(assert (= (and b!387507 res!221498) b!387499))

(assert (= (and b!387499 res!221502) b!387500))

(assert (= (and b!387500 res!221500) b!387504))

(assert (= (and b!387504 res!221504) b!387498))

(assert (= (and b!387498 res!221501) b!387508))

(assert (= (and b!387508 res!221503) b!387505))

(assert (= (and b!387505 res!221499) b!387496))

(assert (= (and b!387496 res!221505) b!387501))

(assert (= (and b!387501 res!221507) b!387497))

(assert (= (and b!387506 condMapEmpty!15885) mapIsEmpty!15885))

(assert (= (and b!387506 (not condMapEmpty!15885)) mapNonEmpty!15885))

(get-info :version)

(assert (= (and mapNonEmpty!15885 ((_ is ValueCellFull!4430) mapValue!15885)) b!387503))

(assert (= (and b!387506 ((_ is ValueCellFull!4430) mapDefault!15885)) b!387502))

(assert (= start!37758 b!387506))

(declare-fun m!383081 () Bool)

(assert (=> b!387501 m!383081))

(declare-fun m!383083 () Bool)

(assert (=> b!387496 m!383083))

(declare-fun m!383085 () Bool)

(assert (=> b!387496 m!383085))

(declare-fun m!383087 () Bool)

(assert (=> b!387497 m!383087))

(declare-fun m!383089 () Bool)

(assert (=> b!387497 m!383089))

(declare-fun m!383091 () Bool)

(assert (=> b!387497 m!383091))

(declare-fun m!383093 () Bool)

(assert (=> b!387508 m!383093))

(declare-fun m!383095 () Bool)

(assert (=> b!387505 m!383095))

(declare-fun m!383097 () Bool)

(assert (=> b!387498 m!383097))

(declare-fun m!383099 () Bool)

(assert (=> b!387499 m!383099))

(declare-fun m!383101 () Bool)

(assert (=> mapNonEmpty!15885 m!383101))

(declare-fun m!383103 () Bool)

(assert (=> start!37758 m!383103))

(declare-fun m!383105 () Bool)

(assert (=> start!37758 m!383105))

(declare-fun m!383107 () Bool)

(assert (=> start!37758 m!383107))

(declare-fun m!383109 () Bool)

(assert (=> b!387500 m!383109))

(check-sat (not b!387500) (not b!387499) (not b!387497) (not b!387496) (not start!37758) b_and!16091 (not b!387498) (not b!387505) (not b_next!8875) (not mapNonEmpty!15885) (not b!387501) tp_is_empty!9547)
(check-sat b_and!16091 (not b_next!8875))
