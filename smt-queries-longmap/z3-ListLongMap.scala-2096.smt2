; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35730 () Bool)

(assert start!35730)

(declare-fun mapNonEmpty!13803 () Bool)

(declare-fun mapRes!13803 () Bool)

(declare-fun tp!27870 () Bool)

(declare-fun e!219681 () Bool)

(assert (=> mapNonEmpty!13803 (= mapRes!13803 (and tp!27870 e!219681))))

(declare-fun mapKey!13803 () (_ BitVec 32))

(declare-datatypes ((V!11907 0))(
  ( (V!11908 (val!4143 Int)) )
))
(declare-datatypes ((ValueCell!3755 0))(
  ( (ValueCellFull!3755 (v!6331 V!11907)) (EmptyCell!3755) )
))
(declare-datatypes ((array!19935 0))(
  ( (array!19936 (arr!9461 (Array (_ BitVec 32) ValueCell!3755)) (size!9814 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19935)

(declare-fun mapRest!13803 () (Array (_ BitVec 32) ValueCell!3755))

(declare-fun mapValue!13803 () ValueCell!3755)

(assert (=> mapNonEmpty!13803 (= (arr!9461 _values!1208) (store mapRest!13803 mapKey!13803 mapValue!13803))))

(declare-fun b!358809 () Bool)

(declare-fun e!219677 () Bool)

(declare-fun e!219680 () Bool)

(assert (=> b!358809 (= e!219677 (and e!219680 mapRes!13803))))

(declare-fun condMapEmpty!13803 () Bool)

(declare-fun mapDefault!13803 () ValueCell!3755)

(assert (=> b!358809 (= condMapEmpty!13803 (= (arr!9461 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3755)) mapDefault!13803)))))

(declare-fun b!358810 () Bool)

(declare-fun res!199472 () Bool)

(declare-fun e!219679 () Bool)

(assert (=> b!358810 (=> (not res!199472) (not e!219679))))

(declare-datatypes ((array!19937 0))(
  ( (array!19938 (arr!9462 (Array (_ BitVec 32) (_ BitVec 64))) (size!9815 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19937)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19937 (_ BitVec 32)) Bool)

(assert (=> b!358810 (= res!199472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358811 () Bool)

(declare-fun tp_is_empty!8197 () Bool)

(assert (=> b!358811 (= e!219680 tp_is_empty!8197)))

(declare-fun b!358812 () Bool)

(assert (=> b!358812 (= e!219679 false)))

(declare-fun lt!166048 () Bool)

(declare-datatypes ((List!5418 0))(
  ( (Nil!5415) (Cons!5414 (h!6270 (_ BitVec 64)) (t!10559 List!5418)) )
))
(declare-fun arrayNoDuplicates!0 (array!19937 (_ BitVec 32) List!5418) Bool)

(assert (=> b!358812 (= lt!166048 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5415))))

(declare-fun mapIsEmpty!13803 () Bool)

(assert (=> mapIsEmpty!13803 mapRes!13803))

(declare-fun b!358813 () Bool)

(declare-fun res!199473 () Bool)

(assert (=> b!358813 (=> (not res!199473) (not e!219679))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358813 (= res!199473 (and (= (size!9814 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9815 _keys!1456) (size!9814 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199474 () Bool)

(assert (=> start!35730 (=> (not res!199474) (not e!219679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35730 (= res!199474 (validMask!0 mask!1842))))

(assert (=> start!35730 e!219679))

(assert (=> start!35730 true))

(declare-fun array_inv!6984 (array!19935) Bool)

(assert (=> start!35730 (and (array_inv!6984 _values!1208) e!219677)))

(declare-fun array_inv!6985 (array!19937) Bool)

(assert (=> start!35730 (array_inv!6985 _keys!1456)))

(declare-fun b!358814 () Bool)

(assert (=> b!358814 (= e!219681 tp_is_empty!8197)))

(assert (= (and start!35730 res!199474) b!358813))

(assert (= (and b!358813 res!199473) b!358810))

(assert (= (and b!358810 res!199472) b!358812))

(assert (= (and b!358809 condMapEmpty!13803) mapIsEmpty!13803))

(assert (= (and b!358809 (not condMapEmpty!13803)) mapNonEmpty!13803))

(get-info :version)

(assert (= (and mapNonEmpty!13803 ((_ is ValueCellFull!3755) mapValue!13803)) b!358814))

(assert (= (and b!358809 ((_ is ValueCellFull!3755) mapDefault!13803)) b!358811))

(assert (= start!35730 b!358809))

(declare-fun m!355977 () Bool)

(assert (=> mapNonEmpty!13803 m!355977))

(declare-fun m!355979 () Bool)

(assert (=> b!358810 m!355979))

(declare-fun m!355981 () Bool)

(assert (=> b!358812 m!355981))

(declare-fun m!355983 () Bool)

(assert (=> start!35730 m!355983))

(declare-fun m!355985 () Bool)

(assert (=> start!35730 m!355985))

(declare-fun m!355987 () Bool)

(assert (=> start!35730 m!355987))

(check-sat tp_is_empty!8197 (not b!358810) (not mapNonEmpty!13803) (not start!35730) (not b!358812))
(check-sat)
