; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37716 () Bool)

(assert start!37716)

(declare-fun b_free!8833 () Bool)

(declare-fun b_next!8833 () Bool)

(assert (=> start!37716 (= b_free!8833 (not b_next!8833))))

(declare-fun tp!31250 () Bool)

(declare-fun b_and!16089 () Bool)

(assert (=> start!37716 (= tp!31250 b_and!16089)))

(declare-fun b!386899 () Bool)

(declare-fun e!234632 () Bool)

(declare-fun e!234631 () Bool)

(assert (=> b!386899 (= e!234632 e!234631)))

(declare-fun res!220998 () Bool)

(assert (=> b!386899 (=> (not res!220998) (not e!234631))))

(declare-datatypes ((array!22896 0))(
  ( (array!22897 (arr!10916 (Array (_ BitVec 32) (_ BitVec 64))) (size!11268 (_ BitVec 32))) )
))
(declare-fun lt!181943 () array!22896)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22896 (_ BitVec 32)) Bool)

(assert (=> b!386899 (= res!220998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181943 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!22896)

(assert (=> b!386899 (= lt!181943 (array!22897 (store (arr!10916 _keys!658) i!548 k0!778) (size!11268 _keys!658)))))

(declare-fun b!386900 () Bool)

(declare-fun e!234635 () Bool)

(declare-fun tp_is_empty!9505 () Bool)

(assert (=> b!386900 (= e!234635 tp_is_empty!9505)))

(declare-fun b!386901 () Bool)

(declare-fun e!234636 () Bool)

(assert (=> b!386901 (= e!234636 tp_is_empty!9505)))

(declare-fun mapIsEmpty!15822 () Bool)

(declare-fun mapRes!15822 () Bool)

(assert (=> mapIsEmpty!15822 mapRes!15822))

(declare-fun b!386902 () Bool)

(declare-fun res!221002 () Bool)

(assert (=> b!386902 (=> (not res!221002) (not e!234631))))

(declare-datatypes ((List!6161 0))(
  ( (Nil!6158) (Cons!6157 (h!7013 (_ BitVec 64)) (t!11303 List!6161)) )
))
(declare-fun arrayNoDuplicates!0 (array!22896 (_ BitVec 32) List!6161) Bool)

(assert (=> b!386902 (= res!221002 (arrayNoDuplicates!0 lt!181943 #b00000000000000000000000000000000 Nil!6158))))

(declare-fun b!386903 () Bool)

(declare-fun res!220994 () Bool)

(assert (=> b!386903 (=> (not res!220994) (not e!234632))))

(assert (=> b!386903 (= res!220994 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11268 _keys!658))))))

(declare-fun b!386904 () Bool)

(declare-fun res!221001 () Bool)

(assert (=> b!386904 (=> (not res!221001) (not e!234632))))

(assert (=> b!386904 (= res!221001 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6158))))

(declare-fun b!386905 () Bool)

(declare-fun res!220996 () Bool)

(assert (=> b!386905 (=> (not res!220996) (not e!234632))))

(declare-fun arrayContainsKey!0 (array!22896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386905 (= res!220996 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386906 () Bool)

(declare-fun res!220999 () Bool)

(assert (=> b!386906 (=> (not res!220999) (not e!234632))))

(assert (=> b!386906 (= res!220999 (or (= (select (arr!10916 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10916 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!220995 () Bool)

(assert (=> start!37716 (=> (not res!220995) (not e!234632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37716 (= res!220995 (validMask!0 mask!970))))

(assert (=> start!37716 e!234632))

(declare-datatypes ((V!13779 0))(
  ( (V!13780 (val!4797 Int)) )
))
(declare-datatypes ((ValueCell!4409 0))(
  ( (ValueCellFull!4409 (v!6995 V!13779)) (EmptyCell!4409) )
))
(declare-datatypes ((array!22898 0))(
  ( (array!22899 (arr!10917 (Array (_ BitVec 32) ValueCell!4409)) (size!11269 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22898)

(declare-fun e!234633 () Bool)

(declare-fun array_inv!8068 (array!22898) Bool)

(assert (=> start!37716 (and (array_inv!8068 _values!506) e!234633)))

(assert (=> start!37716 tp!31250))

(assert (=> start!37716 true))

(assert (=> start!37716 tp_is_empty!9505))

(declare-fun array_inv!8069 (array!22896) Bool)

(assert (=> start!37716 (array_inv!8069 _keys!658)))

(declare-fun b!386907 () Bool)

(assert (=> b!386907 (= e!234633 (and e!234635 mapRes!15822))))

(declare-fun condMapEmpty!15822 () Bool)

(declare-fun mapDefault!15822 () ValueCell!4409)

(assert (=> b!386907 (= condMapEmpty!15822 (= (arr!10917 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4409)) mapDefault!15822)))))

(declare-fun b!386908 () Bool)

(declare-fun res!221003 () Bool)

(assert (=> b!386908 (=> (not res!221003) (not e!234632))))

(assert (=> b!386908 (= res!221003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386909 () Bool)

(declare-fun res!220997 () Bool)

(assert (=> b!386909 (=> (not res!220997) (not e!234632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386909 (= res!220997 (validKeyInArray!0 k0!778))))

(declare-fun b!386910 () Bool)

(declare-fun res!221000 () Bool)

(assert (=> b!386910 (=> (not res!221000) (not e!234632))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!386910 (= res!221000 (and (= (size!11269 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11268 _keys!658) (size!11269 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15822 () Bool)

(declare-fun tp!31251 () Bool)

(assert (=> mapNonEmpty!15822 (= mapRes!15822 (and tp!31251 e!234636))))

(declare-fun mapValue!15822 () ValueCell!4409)

(declare-fun mapKey!15822 () (_ BitVec 32))

(declare-fun mapRest!15822 () (Array (_ BitVec 32) ValueCell!4409))

(assert (=> mapNonEmpty!15822 (= (arr!10917 _values!506) (store mapRest!15822 mapKey!15822 mapValue!15822))))

(declare-fun b!386911 () Bool)

(assert (=> b!386911 (= e!234631 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6314 0))(
  ( (tuple2!6315 (_1!3168 (_ BitVec 64)) (_2!3168 V!13779)) )
))
(declare-datatypes ((List!6162 0))(
  ( (Nil!6159) (Cons!6158 (h!7014 tuple2!6314) (t!11304 List!6162)) )
))
(declare-datatypes ((ListLongMap!5229 0))(
  ( (ListLongMap!5230 (toList!2630 List!6162)) )
))
(declare-fun lt!181944 () ListLongMap!5229)

(declare-fun zeroValue!472 () V!13779)

(declare-fun v!373 () V!13779)

(declare-fun minValue!472 () V!13779)

(declare-fun getCurrentListMapNoExtraKeys!905 (array!22896 array!22898 (_ BitVec 32) (_ BitVec 32) V!13779 V!13779 (_ BitVec 32) Int) ListLongMap!5229)

(assert (=> b!386911 (= lt!181944 (getCurrentListMapNoExtraKeys!905 lt!181943 (array!22899 (store (arr!10917 _values!506) i!548 (ValueCellFull!4409 v!373)) (size!11269 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181945 () ListLongMap!5229)

(assert (=> b!386911 (= lt!181945 (getCurrentListMapNoExtraKeys!905 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37716 res!220995) b!386910))

(assert (= (and b!386910 res!221000) b!386908))

(assert (= (and b!386908 res!221003) b!386904))

(assert (= (and b!386904 res!221001) b!386903))

(assert (= (and b!386903 res!220994) b!386909))

(assert (= (and b!386909 res!220997) b!386906))

(assert (= (and b!386906 res!220999) b!386905))

(assert (= (and b!386905 res!220996) b!386899))

(assert (= (and b!386899 res!220998) b!386902))

(assert (= (and b!386902 res!221002) b!386911))

(assert (= (and b!386907 condMapEmpty!15822) mapIsEmpty!15822))

(assert (= (and b!386907 (not condMapEmpty!15822)) mapNonEmpty!15822))

(get-info :version)

(assert (= (and mapNonEmpty!15822 ((_ is ValueCellFull!4409) mapValue!15822)) b!386901))

(assert (= (and b!386907 ((_ is ValueCellFull!4409) mapDefault!15822)) b!386900))

(assert (= start!37716 b!386907))

(declare-fun m!383405 () Bool)

(assert (=> b!386906 m!383405))

(declare-fun m!383407 () Bool)

(assert (=> b!386899 m!383407))

(declare-fun m!383409 () Bool)

(assert (=> b!386899 m!383409))

(declare-fun m!383411 () Bool)

(assert (=> b!386902 m!383411))

(declare-fun m!383413 () Bool)

(assert (=> b!386909 m!383413))

(declare-fun m!383415 () Bool)

(assert (=> b!386911 m!383415))

(declare-fun m!383417 () Bool)

(assert (=> b!386911 m!383417))

(declare-fun m!383419 () Bool)

(assert (=> b!386911 m!383419))

(declare-fun m!383421 () Bool)

(assert (=> b!386904 m!383421))

(declare-fun m!383423 () Bool)

(assert (=> start!37716 m!383423))

(declare-fun m!383425 () Bool)

(assert (=> start!37716 m!383425))

(declare-fun m!383427 () Bool)

(assert (=> start!37716 m!383427))

(declare-fun m!383429 () Bool)

(assert (=> b!386908 m!383429))

(declare-fun m!383431 () Bool)

(assert (=> mapNonEmpty!15822 m!383431))

(declare-fun m!383433 () Bool)

(assert (=> b!386905 m!383433))

(check-sat (not mapNonEmpty!15822) (not b_next!8833) (not b!386902) b_and!16089 (not b!386904) tp_is_empty!9505 (not b!386905) (not b!386899) (not b!386911) (not b!386909) (not start!37716) (not b!386908))
(check-sat b_and!16089 (not b_next!8833))
