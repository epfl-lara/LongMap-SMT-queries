; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36814 () Bool)

(assert start!36814)

(declare-fun b_free!7941 () Bool)

(declare-fun b_next!7941 () Bool)

(assert (=> start!36814 (= b_free!7941 (not b_next!7941))))

(declare-fun tp!28539 () Bool)

(declare-fun b_and!15183 () Bool)

(assert (=> start!36814 (= tp!28539 b_and!15183)))

(declare-fun b!367889 () Bool)

(declare-fun res!206066 () Bool)

(declare-fun e!225080 () Bool)

(assert (=> b!367889 (=> (not res!206066) (not e!225080))))

(declare-datatypes ((array!21135 0))(
  ( (array!21136 (arr!10036 (Array (_ BitVec 32) (_ BitVec 64))) (size!10388 (_ BitVec 32))) )
))
(declare-fun lt!169446 () array!21135)

(declare-datatypes ((List!5576 0))(
  ( (Nil!5573) (Cons!5572 (h!6428 (_ BitVec 64)) (t!10726 List!5576)) )
))
(declare-fun arrayNoDuplicates!0 (array!21135 (_ BitVec 32) List!5576) Bool)

(assert (=> b!367889 (= res!206066 (arrayNoDuplicates!0 lt!169446 #b00000000000000000000000000000000 Nil!5573))))

(declare-fun mapNonEmpty!14448 () Bool)

(declare-fun mapRes!14448 () Bool)

(declare-fun tp!28538 () Bool)

(declare-fun e!225078 () Bool)

(assert (=> mapNonEmpty!14448 (= mapRes!14448 (and tp!28538 e!225078))))

(declare-fun mapKey!14448 () (_ BitVec 32))

(declare-datatypes ((V!12557 0))(
  ( (V!12558 (val!4339 Int)) )
))
(declare-datatypes ((ValueCell!3951 0))(
  ( (ValueCellFull!3951 (v!6536 V!12557)) (EmptyCell!3951) )
))
(declare-fun mapValue!14448 () ValueCell!3951)

(declare-datatypes ((array!21137 0))(
  ( (array!21138 (arr!10037 (Array (_ BitVec 32) ValueCell!3951)) (size!10389 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21137)

(declare-fun mapRest!14448 () (Array (_ BitVec 32) ValueCell!3951))

(assert (=> mapNonEmpty!14448 (= (arr!10037 _values!506) (store mapRest!14448 mapKey!14448 mapValue!14448))))

(declare-fun res!206069 () Bool)

(declare-fun e!225081 () Bool)

(assert (=> start!36814 (=> (not res!206069) (not e!225081))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36814 (= res!206069 (validMask!0 mask!970))))

(assert (=> start!36814 e!225081))

(assert (=> start!36814 true))

(declare-fun e!225079 () Bool)

(declare-fun array_inv!7422 (array!21137) Bool)

(assert (=> start!36814 (and (array_inv!7422 _values!506) e!225079)))

(assert (=> start!36814 tp!28539))

(declare-fun tp_is_empty!8589 () Bool)

(assert (=> start!36814 tp_is_empty!8589))

(declare-fun _keys!658 () array!21135)

(declare-fun array_inv!7423 (array!21135) Bool)

(assert (=> start!36814 (array_inv!7423 _keys!658)))

(declare-fun b!367890 () Bool)

(declare-fun res!206067 () Bool)

(assert (=> b!367890 (=> (not res!206067) (not e!225081))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367890 (= res!206067 (or (= (select (arr!10036 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10036 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367891 () Bool)

(declare-fun res!206062 () Bool)

(assert (=> b!367891 (=> (not res!206062) (not e!225081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21135 (_ BitVec 32)) Bool)

(assert (=> b!367891 (= res!206062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367892 () Bool)

(declare-fun res!206060 () Bool)

(assert (=> b!367892 (=> (not res!206060) (not e!225081))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367892 (= res!206060 (and (= (size!10389 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10388 _keys!658) (size!10389 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367893 () Bool)

(assert (=> b!367893 (= e!225081 e!225080)))

(declare-fun res!206063 () Bool)

(assert (=> b!367893 (=> (not res!206063) (not e!225080))))

(assert (=> b!367893 (= res!206063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169446 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!367893 (= lt!169446 (array!21136 (store (arr!10036 _keys!658) i!548 k0!778) (size!10388 _keys!658)))))

(declare-fun b!367894 () Bool)

(declare-fun res!206064 () Bool)

(assert (=> b!367894 (=> (not res!206064) (not e!225081))))

(assert (=> b!367894 (= res!206064 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5573))))

(declare-fun b!367895 () Bool)

(assert (=> b!367895 (= e!225080 false)))

(declare-fun zeroValue!472 () V!12557)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5744 0))(
  ( (tuple2!5745 (_1!2883 (_ BitVec 64)) (_2!2883 V!12557)) )
))
(declare-datatypes ((List!5577 0))(
  ( (Nil!5574) (Cons!5573 (h!6429 tuple2!5744) (t!10727 List!5577)) )
))
(declare-datatypes ((ListLongMap!4657 0))(
  ( (ListLongMap!4658 (toList!2344 List!5577)) )
))
(declare-fun lt!169445 () ListLongMap!4657)

(declare-fun minValue!472 () V!12557)

(declare-fun getCurrentListMapNoExtraKeys!621 (array!21135 array!21137 (_ BitVec 32) (_ BitVec 32) V!12557 V!12557 (_ BitVec 32) Int) ListLongMap!4657)

(assert (=> b!367895 (= lt!169445 (getCurrentListMapNoExtraKeys!621 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!367896 () Bool)

(declare-fun res!206065 () Bool)

(assert (=> b!367896 (=> (not res!206065) (not e!225081))))

(assert (=> b!367896 (= res!206065 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10388 _keys!658))))))

(declare-fun b!367897 () Bool)

(declare-fun e!225082 () Bool)

(assert (=> b!367897 (= e!225079 (and e!225082 mapRes!14448))))

(declare-fun condMapEmpty!14448 () Bool)

(declare-fun mapDefault!14448 () ValueCell!3951)

(assert (=> b!367897 (= condMapEmpty!14448 (= (arr!10037 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3951)) mapDefault!14448)))))

(declare-fun b!367898 () Bool)

(assert (=> b!367898 (= e!225078 tp_is_empty!8589)))

(declare-fun mapIsEmpty!14448 () Bool)

(assert (=> mapIsEmpty!14448 mapRes!14448))

(declare-fun b!367899 () Bool)

(declare-fun res!206061 () Bool)

(assert (=> b!367899 (=> (not res!206061) (not e!225081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367899 (= res!206061 (validKeyInArray!0 k0!778))))

(declare-fun b!367900 () Bool)

(assert (=> b!367900 (= e!225082 tp_is_empty!8589)))

(declare-fun b!367901 () Bool)

(declare-fun res!206068 () Bool)

(assert (=> b!367901 (=> (not res!206068) (not e!225081))))

(declare-fun arrayContainsKey!0 (array!21135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367901 (= res!206068 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36814 res!206069) b!367892))

(assert (= (and b!367892 res!206060) b!367891))

(assert (= (and b!367891 res!206062) b!367894))

(assert (= (and b!367894 res!206064) b!367896))

(assert (= (and b!367896 res!206065) b!367899))

(assert (= (and b!367899 res!206061) b!367890))

(assert (= (and b!367890 res!206067) b!367901))

(assert (= (and b!367901 res!206068) b!367893))

(assert (= (and b!367893 res!206063) b!367889))

(assert (= (and b!367889 res!206066) b!367895))

(assert (= (and b!367897 condMapEmpty!14448) mapIsEmpty!14448))

(assert (= (and b!367897 (not condMapEmpty!14448)) mapNonEmpty!14448))

(get-info :version)

(assert (= (and mapNonEmpty!14448 ((_ is ValueCellFull!3951) mapValue!14448)) b!367898))

(assert (= (and b!367897 ((_ is ValueCellFull!3951) mapDefault!14448)) b!367900))

(assert (= start!36814 b!367897))

(declare-fun m!364715 () Bool)

(assert (=> b!367894 m!364715))

(declare-fun m!364717 () Bool)

(assert (=> b!367890 m!364717))

(declare-fun m!364719 () Bool)

(assert (=> b!367899 m!364719))

(declare-fun m!364721 () Bool)

(assert (=> b!367895 m!364721))

(declare-fun m!364723 () Bool)

(assert (=> mapNonEmpty!14448 m!364723))

(declare-fun m!364725 () Bool)

(assert (=> b!367901 m!364725))

(declare-fun m!364727 () Bool)

(assert (=> b!367891 m!364727))

(declare-fun m!364729 () Bool)

(assert (=> start!36814 m!364729))

(declare-fun m!364731 () Bool)

(assert (=> start!36814 m!364731))

(declare-fun m!364733 () Bool)

(assert (=> start!36814 m!364733))

(declare-fun m!364735 () Bool)

(assert (=> b!367893 m!364735))

(declare-fun m!364737 () Bool)

(assert (=> b!367893 m!364737))

(declare-fun m!364739 () Bool)

(assert (=> b!367889 m!364739))

(check-sat (not b!367891) (not b!367901) (not b!367895) (not start!36814) (not mapNonEmpty!14448) (not b!367889) (not b!367899) (not b!367894) b_and!15183 (not b_next!7941) (not b!367893) tp_is_empty!8589)
(check-sat b_and!15183 (not b_next!7941))
