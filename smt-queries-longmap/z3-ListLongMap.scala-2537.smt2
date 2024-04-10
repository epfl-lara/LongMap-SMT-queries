; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39042 () Bool)

(assert start!39042)

(declare-fun b_free!9309 () Bool)

(declare-fun b_next!9309 () Bool)

(assert (=> start!39042 (= b_free!9309 (not b_next!9309))))

(declare-fun tp!33456 () Bool)

(declare-fun b_and!16695 () Bool)

(assert (=> start!39042 (= tp!33456 b_and!16695)))

(declare-fun b!409557 () Bool)

(declare-fun res!237189 () Bool)

(declare-fun e!245656 () Bool)

(assert (=> b!409557 (=> (not res!237189) (not e!245656))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24795 0))(
  ( (array!24796 (arr!11847 (Array (_ BitVec 32) (_ BitVec 64))) (size!12199 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24795)

(assert (=> b!409557 (= res!237189 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12199 _keys!709))))))

(declare-fun b!409558 () Bool)

(declare-fun res!237191 () Bool)

(declare-fun e!245653 () Bool)

(assert (=> b!409558 (=> (not res!237191) (not e!245653))))

(declare-fun lt!188962 () array!24795)

(declare-datatypes ((List!6861 0))(
  ( (Nil!6858) (Cons!6857 (h!7713 (_ BitVec 64)) (t!12035 List!6861)) )
))
(declare-fun arrayNoDuplicates!0 (array!24795 (_ BitVec 32) List!6861) Bool)

(assert (=> b!409558 (= res!237191 (arrayNoDuplicates!0 lt!188962 #b00000000000000000000000000000000 Nil!6858))))

(declare-fun b!409559 () Bool)

(declare-fun res!237192 () Bool)

(assert (=> b!409559 (=> (not res!237192) (not e!245656))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409559 (= res!237192 (validKeyInArray!0 k0!794))))

(declare-fun b!409560 () Bool)

(declare-fun e!245654 () Bool)

(declare-fun tp_is_empty!10461 () Bool)

(assert (=> b!409560 (= e!245654 tp_is_empty!10461)))

(declare-fun res!237195 () Bool)

(assert (=> start!39042 (=> (not res!237195) (not e!245656))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39042 (= res!237195 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12199 _keys!709))))))

(assert (=> start!39042 e!245656))

(assert (=> start!39042 tp_is_empty!10461))

(assert (=> start!39042 tp!33456))

(assert (=> start!39042 true))

(declare-datatypes ((V!15053 0))(
  ( (V!15054 (val!5275 Int)) )
))
(declare-datatypes ((ValueCell!4887 0))(
  ( (ValueCellFull!4887 (v!7522 V!15053)) (EmptyCell!4887) )
))
(declare-datatypes ((array!24797 0))(
  ( (array!24798 (arr!11848 (Array (_ BitVec 32) ValueCell!4887)) (size!12200 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24797)

(declare-fun e!245655 () Bool)

(declare-fun array_inv!8646 (array!24797) Bool)

(assert (=> start!39042 (and (array_inv!8646 _values!549) e!245655)))

(declare-fun array_inv!8647 (array!24795) Bool)

(assert (=> start!39042 (array_inv!8647 _keys!709)))

(declare-fun b!409561 () Bool)

(assert (=> b!409561 (= e!245653 false)))

(declare-fun minValue!515 () V!15053)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6838 0))(
  ( (tuple2!6839 (_1!3430 (_ BitVec 64)) (_2!3430 V!15053)) )
))
(declare-datatypes ((List!6862 0))(
  ( (Nil!6859) (Cons!6858 (h!7714 tuple2!6838) (t!12036 List!6862)) )
))
(declare-datatypes ((ListLongMap!5751 0))(
  ( (ListLongMap!5752 (toList!2891 List!6862)) )
))
(declare-fun lt!188963 () ListLongMap!5751)

(declare-fun zeroValue!515 () V!15053)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1099 (array!24795 array!24797 (_ BitVec 32) (_ BitVec 32) V!15053 V!15053 (_ BitVec 32) Int) ListLongMap!5751)

(assert (=> b!409561 (= lt!188963 (getCurrentListMapNoExtraKeys!1099 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17313 () Bool)

(declare-fun mapRes!17313 () Bool)

(assert (=> mapIsEmpty!17313 mapRes!17313))

(declare-fun b!409562 () Bool)

(declare-fun res!237190 () Bool)

(assert (=> b!409562 (=> (not res!237190) (not e!245656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409562 (= res!237190 (validMask!0 mask!1025))))

(declare-fun b!409563 () Bool)

(assert (=> b!409563 (= e!245655 (and e!245654 mapRes!17313))))

(declare-fun condMapEmpty!17313 () Bool)

(declare-fun mapDefault!17313 () ValueCell!4887)

(assert (=> b!409563 (= condMapEmpty!17313 (= (arr!11848 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4887)) mapDefault!17313)))))

(declare-fun b!409564 () Bool)

(assert (=> b!409564 (= e!245656 e!245653)))

(declare-fun res!237186 () Bool)

(assert (=> b!409564 (=> (not res!237186) (not e!245653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24795 (_ BitVec 32)) Bool)

(assert (=> b!409564 (= res!237186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188962 mask!1025))))

(assert (=> b!409564 (= lt!188962 (array!24796 (store (arr!11847 _keys!709) i!563 k0!794) (size!12199 _keys!709)))))

(declare-fun b!409565 () Bool)

(declare-fun res!237188 () Bool)

(assert (=> b!409565 (=> (not res!237188) (not e!245656))))

(assert (=> b!409565 (= res!237188 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6858))))

(declare-fun mapNonEmpty!17313 () Bool)

(declare-fun tp!33455 () Bool)

(declare-fun e!245657 () Bool)

(assert (=> mapNonEmpty!17313 (= mapRes!17313 (and tp!33455 e!245657))))

(declare-fun mapKey!17313 () (_ BitVec 32))

(declare-fun mapRest!17313 () (Array (_ BitVec 32) ValueCell!4887))

(declare-fun mapValue!17313 () ValueCell!4887)

(assert (=> mapNonEmpty!17313 (= (arr!11848 _values!549) (store mapRest!17313 mapKey!17313 mapValue!17313))))

(declare-fun b!409566 () Bool)

(declare-fun res!237185 () Bool)

(assert (=> b!409566 (=> (not res!237185) (not e!245656))))

(assert (=> b!409566 (= res!237185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409567 () Bool)

(declare-fun res!237187 () Bool)

(assert (=> b!409567 (=> (not res!237187) (not e!245656))))

(assert (=> b!409567 (= res!237187 (and (= (size!12200 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12199 _keys!709) (size!12200 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409568 () Bool)

(declare-fun res!237194 () Bool)

(assert (=> b!409568 (=> (not res!237194) (not e!245653))))

(assert (=> b!409568 (= res!237194 (bvsle from!863 i!563))))

(declare-fun b!409569 () Bool)

(declare-fun res!237184 () Bool)

(assert (=> b!409569 (=> (not res!237184) (not e!245656))))

(declare-fun arrayContainsKey!0 (array!24795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409569 (= res!237184 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409570 () Bool)

(assert (=> b!409570 (= e!245657 tp_is_empty!10461)))

(declare-fun b!409571 () Bool)

(declare-fun res!237193 () Bool)

(assert (=> b!409571 (=> (not res!237193) (not e!245656))))

(assert (=> b!409571 (= res!237193 (or (= (select (arr!11847 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11847 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39042 res!237195) b!409562))

(assert (= (and b!409562 res!237190) b!409567))

(assert (= (and b!409567 res!237187) b!409566))

(assert (= (and b!409566 res!237185) b!409565))

(assert (= (and b!409565 res!237188) b!409557))

(assert (= (and b!409557 res!237189) b!409559))

(assert (= (and b!409559 res!237192) b!409571))

(assert (= (and b!409571 res!237193) b!409569))

(assert (= (and b!409569 res!237184) b!409564))

(assert (= (and b!409564 res!237186) b!409558))

(assert (= (and b!409558 res!237191) b!409568))

(assert (= (and b!409568 res!237194) b!409561))

(assert (= (and b!409563 condMapEmpty!17313) mapIsEmpty!17313))

(assert (= (and b!409563 (not condMapEmpty!17313)) mapNonEmpty!17313))

(get-info :version)

(assert (= (and mapNonEmpty!17313 ((_ is ValueCellFull!4887) mapValue!17313)) b!409570))

(assert (= (and b!409563 ((_ is ValueCellFull!4887) mapDefault!17313)) b!409560))

(assert (= start!39042 b!409563))

(declare-fun m!400413 () Bool)

(assert (=> b!409562 m!400413))

(declare-fun m!400415 () Bool)

(assert (=> mapNonEmpty!17313 m!400415))

(declare-fun m!400417 () Bool)

(assert (=> b!409569 m!400417))

(declare-fun m!400419 () Bool)

(assert (=> b!409558 m!400419))

(declare-fun m!400421 () Bool)

(assert (=> b!409564 m!400421))

(declare-fun m!400423 () Bool)

(assert (=> b!409564 m!400423))

(declare-fun m!400425 () Bool)

(assert (=> b!409565 m!400425))

(declare-fun m!400427 () Bool)

(assert (=> b!409571 m!400427))

(declare-fun m!400429 () Bool)

(assert (=> b!409566 m!400429))

(declare-fun m!400431 () Bool)

(assert (=> start!39042 m!400431))

(declare-fun m!400433 () Bool)

(assert (=> start!39042 m!400433))

(declare-fun m!400435 () Bool)

(assert (=> b!409561 m!400435))

(declare-fun m!400437 () Bool)

(assert (=> b!409559 m!400437))

(check-sat (not b!409562) tp_is_empty!10461 (not b!409566) (not b!409558) (not mapNonEmpty!17313) (not b!409569) b_and!16695 (not b!409559) (not b_next!9309) (not b!409561) (not start!39042) (not b!409565) (not b!409564))
(check-sat b_and!16695 (not b_next!9309))
