; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37764 () Bool)

(assert start!37764)

(declare-fun b_free!8881 () Bool)

(declare-fun b_next!8881 () Bool)

(assert (=> start!37764 (= b_free!8881 (not b_next!8881))))

(declare-fun tp!31394 () Bool)

(declare-fun b_and!16097 () Bool)

(assert (=> start!37764 (= tp!31394 b_and!16097)))

(declare-fun b!387613 () Bool)

(declare-fun res!221596 () Bool)

(declare-fun e!234921 () Bool)

(assert (=> b!387613 (=> (not res!221596) (not e!234921))))

(declare-datatypes ((array!22985 0))(
  ( (array!22986 (arr!10961 (Array (_ BitVec 32) (_ BitVec 64))) (size!11314 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22985)

(declare-datatypes ((List!6299 0))(
  ( (Nil!6296) (Cons!6295 (h!7151 (_ BitVec 64)) (t!11440 List!6299)) )
))
(declare-fun arrayNoDuplicates!0 (array!22985 (_ BitVec 32) List!6299) Bool)

(assert (=> b!387613 (= res!221596 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6296))))

(declare-fun mapIsEmpty!15894 () Bool)

(declare-fun mapRes!15894 () Bool)

(assert (=> mapIsEmpty!15894 mapRes!15894))

(declare-fun b!387614 () Bool)

(declare-fun res!221591 () Bool)

(assert (=> b!387614 (=> (not res!221591) (not e!234921))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387614 (= res!221591 (or (= (select (arr!10961 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10961 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387615 () Bool)

(declare-fun e!234922 () Bool)

(declare-fun tp_is_empty!9553 () Bool)

(assert (=> b!387615 (= e!234922 tp_is_empty!9553)))

(declare-fun b!387616 () Bool)

(declare-fun e!234924 () Bool)

(assert (=> b!387616 (= e!234924 false)))

(declare-datatypes ((V!13843 0))(
  ( (V!13844 (val!4821 Int)) )
))
(declare-datatypes ((ValueCell!4433 0))(
  ( (ValueCellFull!4433 (v!7012 V!13843)) (EmptyCell!4433) )
))
(declare-datatypes ((array!22987 0))(
  ( (array!22988 (arr!10962 (Array (_ BitVec 32) ValueCell!4433)) (size!11315 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22987)

(declare-fun lt!181908 () array!22985)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13843)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13843)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((tuple2!6456 0))(
  ( (tuple2!6457 (_1!3239 (_ BitVec 64)) (_2!3239 V!13843)) )
))
(declare-datatypes ((List!6300 0))(
  ( (Nil!6297) (Cons!6296 (h!7152 tuple2!6456) (t!11441 List!6300)) )
))
(declare-datatypes ((ListLongMap!5359 0))(
  ( (ListLongMap!5360 (toList!2695 List!6300)) )
))
(declare-fun lt!181906 () ListLongMap!5359)

(declare-fun minValue!472 () V!13843)

(declare-fun getCurrentListMapNoExtraKeys!935 (array!22985 array!22987 (_ BitVec 32) (_ BitVec 32) V!13843 V!13843 (_ BitVec 32) Int) ListLongMap!5359)

(assert (=> b!387616 (= lt!181906 (getCurrentListMapNoExtraKeys!935 lt!181908 (array!22988 (store (arr!10962 _values!506) i!548 (ValueCellFull!4433 v!373)) (size!11315 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181907 () ListLongMap!5359)

(assert (=> b!387616 (= lt!181907 (getCurrentListMapNoExtraKeys!935 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387617 () Bool)

(assert (=> b!387617 (= e!234921 e!234924)))

(declare-fun res!221597 () Bool)

(assert (=> b!387617 (=> (not res!221597) (not e!234924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22985 (_ BitVec 32)) Bool)

(assert (=> b!387617 (= res!221597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181908 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!387617 (= lt!181908 (array!22986 (store (arr!10961 _keys!658) i!548 k0!778) (size!11314 _keys!658)))))

(declare-fun b!387618 () Bool)

(declare-fun res!221588 () Bool)

(assert (=> b!387618 (=> (not res!221588) (not e!234921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387618 (= res!221588 (validKeyInArray!0 k0!778))))

(declare-fun b!387619 () Bool)

(declare-fun res!221592 () Bool)

(assert (=> b!387619 (=> (not res!221592) (not e!234921))))

(declare-fun arrayContainsKey!0 (array!22985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387619 (= res!221592 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387620 () Bool)

(declare-fun res!221594 () Bool)

(assert (=> b!387620 (=> (not res!221594) (not e!234924))))

(assert (=> b!387620 (= res!221594 (arrayNoDuplicates!0 lt!181908 #b00000000000000000000000000000000 Nil!6296))))

(declare-fun res!221595 () Bool)

(assert (=> start!37764 (=> (not res!221595) (not e!234921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37764 (= res!221595 (validMask!0 mask!970))))

(assert (=> start!37764 e!234921))

(declare-fun e!234925 () Bool)

(declare-fun array_inv!8064 (array!22987) Bool)

(assert (=> start!37764 (and (array_inv!8064 _values!506) e!234925)))

(assert (=> start!37764 tp!31394))

(assert (=> start!37764 true))

(assert (=> start!37764 tp_is_empty!9553))

(declare-fun array_inv!8065 (array!22985) Bool)

(assert (=> start!37764 (array_inv!8065 _keys!658)))

(declare-fun b!387621 () Bool)

(assert (=> b!387621 (= e!234925 (and e!234922 mapRes!15894))))

(declare-fun condMapEmpty!15894 () Bool)

(declare-fun mapDefault!15894 () ValueCell!4433)

(assert (=> b!387621 (= condMapEmpty!15894 (= (arr!10962 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4433)) mapDefault!15894)))))

(declare-fun b!387622 () Bool)

(declare-fun res!221593 () Bool)

(assert (=> b!387622 (=> (not res!221593) (not e!234921))))

(assert (=> b!387622 (= res!221593 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11314 _keys!658))))))

(declare-fun mapNonEmpty!15894 () Bool)

(declare-fun tp!31395 () Bool)

(declare-fun e!234926 () Bool)

(assert (=> mapNonEmpty!15894 (= mapRes!15894 (and tp!31395 e!234926))))

(declare-fun mapValue!15894 () ValueCell!4433)

(declare-fun mapRest!15894 () (Array (_ BitVec 32) ValueCell!4433))

(declare-fun mapKey!15894 () (_ BitVec 32))

(assert (=> mapNonEmpty!15894 (= (arr!10962 _values!506) (store mapRest!15894 mapKey!15894 mapValue!15894))))

(declare-fun b!387623 () Bool)

(declare-fun res!221590 () Bool)

(assert (=> b!387623 (=> (not res!221590) (not e!234921))))

(assert (=> b!387623 (= res!221590 (and (= (size!11315 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11314 _keys!658) (size!11315 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387624 () Bool)

(assert (=> b!387624 (= e!234926 tp_is_empty!9553)))

(declare-fun b!387625 () Bool)

(declare-fun res!221589 () Bool)

(assert (=> b!387625 (=> (not res!221589) (not e!234921))))

(assert (=> b!387625 (= res!221589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37764 res!221595) b!387623))

(assert (= (and b!387623 res!221590) b!387625))

(assert (= (and b!387625 res!221589) b!387613))

(assert (= (and b!387613 res!221596) b!387622))

(assert (= (and b!387622 res!221593) b!387618))

(assert (= (and b!387618 res!221588) b!387614))

(assert (= (and b!387614 res!221591) b!387619))

(assert (= (and b!387619 res!221592) b!387617))

(assert (= (and b!387617 res!221597) b!387620))

(assert (= (and b!387620 res!221594) b!387616))

(assert (= (and b!387621 condMapEmpty!15894) mapIsEmpty!15894))

(assert (= (and b!387621 (not condMapEmpty!15894)) mapNonEmpty!15894))

(get-info :version)

(assert (= (and mapNonEmpty!15894 ((_ is ValueCellFull!4433) mapValue!15894)) b!387624))

(assert (= (and b!387621 ((_ is ValueCellFull!4433) mapDefault!15894)) b!387615))

(assert (= start!37764 b!387621))

(declare-fun m!383171 () Bool)

(assert (=> mapNonEmpty!15894 m!383171))

(declare-fun m!383173 () Bool)

(assert (=> b!387620 m!383173))

(declare-fun m!383175 () Bool)

(assert (=> b!387614 m!383175))

(declare-fun m!383177 () Bool)

(assert (=> b!387617 m!383177))

(declare-fun m!383179 () Bool)

(assert (=> b!387617 m!383179))

(declare-fun m!383181 () Bool)

(assert (=> b!387618 m!383181))

(declare-fun m!383183 () Bool)

(assert (=> b!387619 m!383183))

(declare-fun m!383185 () Bool)

(assert (=> b!387625 m!383185))

(declare-fun m!383187 () Bool)

(assert (=> b!387613 m!383187))

(declare-fun m!383189 () Bool)

(assert (=> b!387616 m!383189))

(declare-fun m!383191 () Bool)

(assert (=> b!387616 m!383191))

(declare-fun m!383193 () Bool)

(assert (=> b!387616 m!383193))

(declare-fun m!383195 () Bool)

(assert (=> start!37764 m!383195))

(declare-fun m!383197 () Bool)

(assert (=> start!37764 m!383197))

(declare-fun m!383199 () Bool)

(assert (=> start!37764 m!383199))

(check-sat (not b!387625) (not b!387613) tp_is_empty!9553 (not b_next!8881) (not start!37764) (not b!387617) (not b!387616) (not b!387620) (not mapNonEmpty!15894) (not b!387619) b_and!16097 (not b!387618))
(check-sat b_and!16097 (not b_next!8881))
