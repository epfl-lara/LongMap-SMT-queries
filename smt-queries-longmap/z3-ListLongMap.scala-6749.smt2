; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84796 () Bool)

(assert start!84796)

(declare-fun b_free!20053 () Bool)

(declare-fun b_next!20053 () Bool)

(assert (=> start!84796 (= b_free!20053 (not b_next!20053))))

(declare-fun tp!69951 () Bool)

(declare-fun b_and!32195 () Bool)

(assert (=> start!84796 (= tp!69951 b_and!32195)))

(declare-fun b!990638 () Bool)

(declare-fun res!662187 () Bool)

(declare-fun e!558677 () Bool)

(assert (=> b!990638 (=> (not res!662187) (not e!558677))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36009 0))(
  ( (V!36010 (val!11685 Int)) )
))
(declare-datatypes ((ValueCell!11153 0))(
  ( (ValueCellFull!11153 (v!14252 V!36009)) (EmptyCell!11153) )
))
(declare-datatypes ((array!62544 0))(
  ( (array!62545 (arr!30120 (Array (_ BitVec 32) ValueCell!11153)) (size!30600 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62544)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62546 0))(
  ( (array!62547 (arr!30121 (Array (_ BitVec 32) (_ BitVec 64))) (size!30601 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62546)

(assert (=> b!990638 (= res!662187 (and (= (size!30600 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30601 _keys!1544) (size!30600 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990639 () Bool)

(declare-fun res!662189 () Bool)

(assert (=> b!990639 (=> (not res!662189) (not e!558677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62546 (_ BitVec 32)) Bool)

(assert (=> b!990639 (= res!662189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36949 () Bool)

(declare-fun mapRes!36949 () Bool)

(assert (=> mapIsEmpty!36949 mapRes!36949))

(declare-fun b!990640 () Bool)

(declare-fun res!662186 () Bool)

(assert (=> b!990640 (=> (not res!662186) (not e!558677))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990640 (= res!662186 (validKeyInArray!0 (select (arr!30121 _keys!1544) from!1932)))))

(declare-fun b!990641 () Bool)

(declare-fun res!662184 () Bool)

(assert (=> b!990641 (=> (not res!662184) (not e!558677))))

(assert (=> b!990641 (= res!662184 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!662183 () Bool)

(assert (=> start!84796 (=> (not res!662183) (not e!558677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84796 (= res!662183 (validMask!0 mask!1948))))

(assert (=> start!84796 e!558677))

(assert (=> start!84796 true))

(declare-fun tp_is_empty!23269 () Bool)

(assert (=> start!84796 tp_is_empty!23269))

(declare-fun e!558674 () Bool)

(declare-fun array_inv!23297 (array!62544) Bool)

(assert (=> start!84796 (and (array_inv!23297 _values!1278) e!558674)))

(assert (=> start!84796 tp!69951))

(declare-fun array_inv!23298 (array!62546) Bool)

(assert (=> start!84796 (array_inv!23298 _keys!1544)))

(declare-fun mapNonEmpty!36949 () Bool)

(declare-fun tp!69952 () Bool)

(declare-fun e!558678 () Bool)

(assert (=> mapNonEmpty!36949 (= mapRes!36949 (and tp!69952 e!558678))))

(declare-fun mapRest!36949 () (Array (_ BitVec 32) ValueCell!11153))

(declare-fun mapKey!36949 () (_ BitVec 32))

(declare-fun mapValue!36949 () ValueCell!11153)

(assert (=> mapNonEmpty!36949 (= (arr!30120 _values!1278) (store mapRest!36949 mapKey!36949 mapValue!36949))))

(declare-fun b!990642 () Bool)

(declare-fun res!662188 () Bool)

(assert (=> b!990642 (=> (not res!662188) (not e!558677))))

(assert (=> b!990642 (= res!662188 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30601 _keys!1544))))))

(declare-fun b!990643 () Bool)

(assert (=> b!990643 (= e!558677 (bvsge from!1932 (size!30600 _values!1278)))))

(declare-fun minValue!1220 () V!36009)

(declare-fun zeroValue!1220 () V!36009)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14916 0))(
  ( (tuple2!14917 (_1!7469 (_ BitVec 64)) (_2!7469 V!36009)) )
))
(declare-datatypes ((List!20822 0))(
  ( (Nil!20819) (Cons!20818 (h!21986 tuple2!14916) (t!29771 List!20822)) )
))
(declare-datatypes ((ListLongMap!13615 0))(
  ( (ListLongMap!13616 (toList!6823 List!20822)) )
))
(declare-fun lt!439468 () ListLongMap!13615)

(declare-fun getCurrentListMapNoExtraKeys!3551 (array!62546 array!62544 (_ BitVec 32) (_ BitVec 32) V!36009 V!36009 (_ BitVec 32) Int) ListLongMap!13615)

(assert (=> b!990643 (= lt!439468 (getCurrentListMapNoExtraKeys!3551 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990644 () Bool)

(declare-fun res!662185 () Bool)

(assert (=> b!990644 (=> (not res!662185) (not e!558677))))

(declare-datatypes ((List!20823 0))(
  ( (Nil!20820) (Cons!20819 (h!21987 (_ BitVec 64)) (t!29772 List!20823)) )
))
(declare-fun arrayNoDuplicates!0 (array!62546 (_ BitVec 32) List!20823) Bool)

(assert (=> b!990644 (= res!662185 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20820))))

(declare-fun b!990645 () Bool)

(assert (=> b!990645 (= e!558678 tp_is_empty!23269)))

(declare-fun b!990646 () Bool)

(declare-fun e!558676 () Bool)

(assert (=> b!990646 (= e!558676 tp_is_empty!23269)))

(declare-fun b!990647 () Bool)

(assert (=> b!990647 (= e!558674 (and e!558676 mapRes!36949))))

(declare-fun condMapEmpty!36949 () Bool)

(declare-fun mapDefault!36949 () ValueCell!11153)

(assert (=> b!990647 (= condMapEmpty!36949 (= (arr!30120 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11153)) mapDefault!36949)))))

(assert (= (and start!84796 res!662183) b!990638))

(assert (= (and b!990638 res!662187) b!990639))

(assert (= (and b!990639 res!662189) b!990644))

(assert (= (and b!990644 res!662185) b!990642))

(assert (= (and b!990642 res!662188) b!990640))

(assert (= (and b!990640 res!662186) b!990641))

(assert (= (and b!990641 res!662184) b!990643))

(assert (= (and b!990647 condMapEmpty!36949) mapIsEmpty!36949))

(assert (= (and b!990647 (not condMapEmpty!36949)) mapNonEmpty!36949))

(get-info :version)

(assert (= (and mapNonEmpty!36949 ((_ is ValueCellFull!11153) mapValue!36949)) b!990645))

(assert (= (and b!990647 ((_ is ValueCellFull!11153) mapDefault!36949)) b!990646))

(assert (= start!84796 b!990647))

(declare-fun m!918525 () Bool)

(assert (=> b!990639 m!918525))

(declare-fun m!918527 () Bool)

(assert (=> start!84796 m!918527))

(declare-fun m!918529 () Bool)

(assert (=> start!84796 m!918529))

(declare-fun m!918531 () Bool)

(assert (=> start!84796 m!918531))

(declare-fun m!918533 () Bool)

(assert (=> mapNonEmpty!36949 m!918533))

(declare-fun m!918535 () Bool)

(assert (=> b!990640 m!918535))

(assert (=> b!990640 m!918535))

(declare-fun m!918537 () Bool)

(assert (=> b!990640 m!918537))

(declare-fun m!918539 () Bool)

(assert (=> b!990643 m!918539))

(declare-fun m!918541 () Bool)

(assert (=> b!990644 m!918541))

(check-sat tp_is_empty!23269 (not b!990639) (not mapNonEmpty!36949) (not b_next!20053) (not b!990640) (not b!990643) b_and!32195 (not start!84796) (not b!990644))
(check-sat b_and!32195 (not b_next!20053))
