; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20176 () Bool)

(assert start!20176)

(declare-fun b_free!4831 () Bool)

(declare-fun b_next!4831 () Bool)

(assert (=> start!20176 (= b_free!4831 (not b_next!4831))))

(declare-fun tp!17525 () Bool)

(declare-fun b_and!11591 () Bool)

(assert (=> start!20176 (= tp!17525 b_and!11591)))

(declare-fun b!198061 () Bool)

(declare-fun res!93817 () Bool)

(declare-fun e!130235 () Bool)

(assert (=> b!198061 (=> (not res!93817) (not e!130235))))

(declare-datatypes ((array!8613 0))(
  ( (array!8614 (arr!4057 (Array (_ BitVec 32) (_ BitVec 64))) (size!4382 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8613)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5897 0))(
  ( (V!5898 (val!2388 Int)) )
))
(declare-datatypes ((ValueCell!2000 0))(
  ( (ValueCellFull!2000 (v!4359 V!5897)) (EmptyCell!2000) )
))
(declare-datatypes ((array!8615 0))(
  ( (array!8616 (arr!4058 (Array (_ BitVec 32) ValueCell!2000)) (size!4383 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8615)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198061 (= res!93817 (and (= (size!4383 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4382 _keys!825) (size!4383 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8099 () Bool)

(declare-fun mapRes!8099 () Bool)

(assert (=> mapIsEmpty!8099 mapRes!8099))

(declare-fun b!198062 () Bool)

(declare-fun res!93814 () Bool)

(assert (=> b!198062 (=> (not res!93814) (not e!130235))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198062 (= res!93814 (validKeyInArray!0 k0!843))))

(declare-fun b!198063 () Bool)

(declare-fun res!93813 () Bool)

(assert (=> b!198063 (=> (not res!93813) (not e!130235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8613 (_ BitVec 32)) Bool)

(assert (=> b!198063 (= res!93813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198064 () Bool)

(assert (=> b!198064 (= e!130235 false)))

(declare-datatypes ((tuple2!3572 0))(
  ( (tuple2!3573 (_1!1797 (_ BitVec 64)) (_2!1797 V!5897)) )
))
(declare-datatypes ((List!2489 0))(
  ( (Nil!2486) (Cons!2485 (h!3127 tuple2!3572) (t!7412 List!2489)) )
))
(declare-datatypes ((ListLongMap!2487 0))(
  ( (ListLongMap!2488 (toList!1259 List!2489)) )
))
(declare-fun lt!97892 () ListLongMap!2487)

(declare-fun v!520 () V!5897)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5897)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5897)

(declare-fun getCurrentListMapNoExtraKeys!249 (array!8613 array!8615 (_ BitVec 32) (_ BitVec 32) V!5897 V!5897 (_ BitVec 32) Int) ListLongMap!2487)

(assert (=> b!198064 (= lt!97892 (getCurrentListMapNoExtraKeys!249 _keys!825 (array!8616 (store (arr!4058 _values!649) i!601 (ValueCellFull!2000 v!520)) (size!4383 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97891 () ListLongMap!2487)

(assert (=> b!198064 (= lt!97891 (getCurrentListMapNoExtraKeys!249 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198065 () Bool)

(declare-fun e!130234 () Bool)

(declare-fun e!130236 () Bool)

(assert (=> b!198065 (= e!130234 (and e!130236 mapRes!8099))))

(declare-fun condMapEmpty!8099 () Bool)

(declare-fun mapDefault!8099 () ValueCell!2000)

(assert (=> b!198065 (= condMapEmpty!8099 (= (arr!4058 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2000)) mapDefault!8099)))))

(declare-fun b!198066 () Bool)

(declare-fun res!93811 () Bool)

(assert (=> b!198066 (=> (not res!93811) (not e!130235))))

(assert (=> b!198066 (= res!93811 (= (select (arr!4057 _keys!825) i!601) k0!843))))

(declare-fun b!198067 () Bool)

(declare-fun res!93816 () Bool)

(assert (=> b!198067 (=> (not res!93816) (not e!130235))))

(assert (=> b!198067 (= res!93816 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4382 _keys!825))))))

(declare-fun b!198068 () Bool)

(declare-fun tp_is_empty!4687 () Bool)

(assert (=> b!198068 (= e!130236 tp_is_empty!4687)))

(declare-fun mapNonEmpty!8099 () Bool)

(declare-fun tp!17524 () Bool)

(declare-fun e!130238 () Bool)

(assert (=> mapNonEmpty!8099 (= mapRes!8099 (and tp!17524 e!130238))))

(declare-fun mapRest!8099 () (Array (_ BitVec 32) ValueCell!2000))

(declare-fun mapValue!8099 () ValueCell!2000)

(declare-fun mapKey!8099 () (_ BitVec 32))

(assert (=> mapNonEmpty!8099 (= (arr!4058 _values!649) (store mapRest!8099 mapKey!8099 mapValue!8099))))

(declare-fun b!198069 () Bool)

(declare-fun res!93812 () Bool)

(assert (=> b!198069 (=> (not res!93812) (not e!130235))))

(declare-datatypes ((List!2490 0))(
  ( (Nil!2487) (Cons!2486 (h!3128 (_ BitVec 64)) (t!7413 List!2490)) )
))
(declare-fun arrayNoDuplicates!0 (array!8613 (_ BitVec 32) List!2490) Bool)

(assert (=> b!198069 (= res!93812 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2487))))

(declare-fun res!93815 () Bool)

(assert (=> start!20176 (=> (not res!93815) (not e!130235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20176 (= res!93815 (validMask!0 mask!1149))))

(assert (=> start!20176 e!130235))

(declare-fun array_inv!2643 (array!8615) Bool)

(assert (=> start!20176 (and (array_inv!2643 _values!649) e!130234)))

(assert (=> start!20176 true))

(assert (=> start!20176 tp_is_empty!4687))

(declare-fun array_inv!2644 (array!8613) Bool)

(assert (=> start!20176 (array_inv!2644 _keys!825)))

(assert (=> start!20176 tp!17525))

(declare-fun b!198070 () Bool)

(assert (=> b!198070 (= e!130238 tp_is_empty!4687)))

(assert (= (and start!20176 res!93815) b!198061))

(assert (= (and b!198061 res!93817) b!198063))

(assert (= (and b!198063 res!93813) b!198069))

(assert (= (and b!198069 res!93812) b!198067))

(assert (= (and b!198067 res!93816) b!198062))

(assert (= (and b!198062 res!93814) b!198066))

(assert (= (and b!198066 res!93811) b!198064))

(assert (= (and b!198065 condMapEmpty!8099) mapIsEmpty!8099))

(assert (= (and b!198065 (not condMapEmpty!8099)) mapNonEmpty!8099))

(get-info :version)

(assert (= (and mapNonEmpty!8099 ((_ is ValueCellFull!2000) mapValue!8099)) b!198070))

(assert (= (and b!198065 ((_ is ValueCellFull!2000) mapDefault!8099)) b!198068))

(assert (= start!20176 b!198065))

(declare-fun m!224919 () Bool)

(assert (=> mapNonEmpty!8099 m!224919))

(declare-fun m!224921 () Bool)

(assert (=> b!198069 m!224921))

(declare-fun m!224923 () Bool)

(assert (=> b!198062 m!224923))

(declare-fun m!224925 () Bool)

(assert (=> b!198063 m!224925))

(declare-fun m!224927 () Bool)

(assert (=> start!20176 m!224927))

(declare-fun m!224929 () Bool)

(assert (=> start!20176 m!224929))

(declare-fun m!224931 () Bool)

(assert (=> start!20176 m!224931))

(declare-fun m!224933 () Bool)

(assert (=> b!198064 m!224933))

(declare-fun m!224935 () Bool)

(assert (=> b!198064 m!224935))

(declare-fun m!224937 () Bool)

(assert (=> b!198064 m!224937))

(declare-fun m!224939 () Bool)

(assert (=> b!198066 m!224939))

(check-sat (not b!198069) (not b_next!4831) (not mapNonEmpty!8099) (not start!20176) (not b!198063) (not b!198064) b_and!11591 tp_is_empty!4687 (not b!198062))
(check-sat b_and!11591 (not b_next!4831))
