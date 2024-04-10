; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36870 () Bool)

(assert start!36870)

(declare-fun b_free!7997 () Bool)

(declare-fun b_next!7997 () Bool)

(assert (=> start!36870 (= b_free!7997 (not b_next!7997))))

(declare-fun tp!28707 () Bool)

(declare-fun b_and!15239 () Bool)

(assert (=> start!36870 (= tp!28707 b_and!15239)))

(declare-fun res!206905 () Bool)

(declare-fun e!225584 () Bool)

(assert (=> start!36870 (=> (not res!206905) (not e!225584))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36870 (= res!206905 (validMask!0 mask!970))))

(assert (=> start!36870 e!225584))

(declare-datatypes ((V!12631 0))(
  ( (V!12632 (val!4367 Int)) )
))
(declare-datatypes ((ValueCell!3979 0))(
  ( (ValueCellFull!3979 (v!6564 V!12631)) (EmptyCell!3979) )
))
(declare-datatypes ((array!21243 0))(
  ( (array!21244 (arr!10090 (Array (_ BitVec 32) ValueCell!3979)) (size!10442 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21243)

(declare-fun e!225582 () Bool)

(declare-fun array_inv!7456 (array!21243) Bool)

(assert (=> start!36870 (and (array_inv!7456 _values!506) e!225582)))

(assert (=> start!36870 tp!28707))

(assert (=> start!36870 true))

(declare-fun tp_is_empty!8645 () Bool)

(assert (=> start!36870 tp_is_empty!8645))

(declare-datatypes ((array!21245 0))(
  ( (array!21246 (arr!10091 (Array (_ BitVec 32) (_ BitVec 64))) (size!10443 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21245)

(declare-fun array_inv!7457 (array!21245) Bool)

(assert (=> start!36870 (array_inv!7457 _keys!658)))

(declare-fun b!368981 () Bool)

(declare-fun res!206907 () Bool)

(assert (=> b!368981 (=> (not res!206907) (not e!225584))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368981 (= res!206907 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10443 _keys!658))))))

(declare-fun b!368982 () Bool)

(declare-fun res!206903 () Bool)

(assert (=> b!368982 (=> (not res!206903) (not e!225584))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368982 (= res!206903 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368983 () Bool)

(declare-fun e!225583 () Bool)

(assert (=> b!368983 (= e!225583 false)))

(declare-fun lt!169632 () array!21245)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5790 0))(
  ( (tuple2!5791 (_1!2906 (_ BitVec 64)) (_2!2906 V!12631)) )
))
(declare-datatypes ((List!5623 0))(
  ( (Nil!5620) (Cons!5619 (h!6475 tuple2!5790) (t!10773 List!5623)) )
))
(declare-datatypes ((ListLongMap!4703 0))(
  ( (ListLongMap!4704 (toList!2367 List!5623)) )
))
(declare-fun lt!169631 () ListLongMap!4703)

(declare-fun zeroValue!472 () V!12631)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12631)

(declare-fun minValue!472 () V!12631)

(declare-fun getCurrentListMapNoExtraKeys!644 (array!21245 array!21243 (_ BitVec 32) (_ BitVec 32) V!12631 V!12631 (_ BitVec 32) Int) ListLongMap!4703)

(assert (=> b!368983 (= lt!169631 (getCurrentListMapNoExtraKeys!644 lt!169632 (array!21244 (store (arr!10090 _values!506) i!548 (ValueCellFull!3979 v!373)) (size!10442 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169630 () ListLongMap!4703)

(assert (=> b!368983 (= lt!169630 (getCurrentListMapNoExtraKeys!644 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368984 () Bool)

(declare-fun res!206900 () Bool)

(assert (=> b!368984 (=> (not res!206900) (not e!225584))))

(declare-datatypes ((List!5624 0))(
  ( (Nil!5621) (Cons!5620 (h!6476 (_ BitVec 64)) (t!10774 List!5624)) )
))
(declare-fun arrayNoDuplicates!0 (array!21245 (_ BitVec 32) List!5624) Bool)

(assert (=> b!368984 (= res!206900 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5621))))

(declare-fun b!368985 () Bool)

(assert (=> b!368985 (= e!225584 e!225583)))

(declare-fun res!206902 () Bool)

(assert (=> b!368985 (=> (not res!206902) (not e!225583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21245 (_ BitVec 32)) Bool)

(assert (=> b!368985 (= res!206902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169632 mask!970))))

(assert (=> b!368985 (= lt!169632 (array!21246 (store (arr!10091 _keys!658) i!548 k!778) (size!10443 _keys!658)))))

(declare-fun b!368986 () Bool)

(declare-fun res!206904 () Bool)

(assert (=> b!368986 (=> (not res!206904) (not e!225584))))

(assert (=> b!368986 (= res!206904 (or (= (select (arr!10091 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10091 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368987 () Bool)

(declare-fun res!206906 () Bool)

(assert (=> b!368987 (=> (not res!206906) (not e!225584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368987 (= res!206906 (validKeyInArray!0 k!778))))

(declare-fun b!368988 () Bool)

(declare-fun res!206901 () Bool)

(assert (=> b!368988 (=> (not res!206901) (not e!225583))))

(assert (=> b!368988 (= res!206901 (arrayNoDuplicates!0 lt!169632 #b00000000000000000000000000000000 Nil!5621))))

(declare-fun mapIsEmpty!14532 () Bool)

(declare-fun mapRes!14532 () Bool)

(assert (=> mapIsEmpty!14532 mapRes!14532))

(declare-fun mapNonEmpty!14532 () Bool)

(declare-fun tp!28706 () Bool)

(declare-fun e!225587 () Bool)

(assert (=> mapNonEmpty!14532 (= mapRes!14532 (and tp!28706 e!225587))))

(declare-fun mapValue!14532 () ValueCell!3979)

(declare-fun mapRest!14532 () (Array (_ BitVec 32) ValueCell!3979))

(declare-fun mapKey!14532 () (_ BitVec 32))

(assert (=> mapNonEmpty!14532 (= (arr!10090 _values!506) (store mapRest!14532 mapKey!14532 mapValue!14532))))

(declare-fun b!368989 () Bool)

(declare-fun res!206909 () Bool)

(assert (=> b!368989 (=> (not res!206909) (not e!225584))))

(assert (=> b!368989 (= res!206909 (and (= (size!10442 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10443 _keys!658) (size!10442 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368990 () Bool)

(declare-fun e!225586 () Bool)

(assert (=> b!368990 (= e!225586 tp_is_empty!8645)))

(declare-fun b!368991 () Bool)

(assert (=> b!368991 (= e!225587 tp_is_empty!8645)))

(declare-fun b!368992 () Bool)

(assert (=> b!368992 (= e!225582 (and e!225586 mapRes!14532))))

(declare-fun condMapEmpty!14532 () Bool)

(declare-fun mapDefault!14532 () ValueCell!3979)

