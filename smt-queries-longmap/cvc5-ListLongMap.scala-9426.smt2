; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112164 () Bool)

(assert start!112164)

(declare-fun b_free!30559 () Bool)

(declare-fun b_next!30559 () Bool)

(assert (=> start!112164 (= b_free!30559 (not b_next!30559))))

(declare-fun tp!107314 () Bool)

(declare-fun b_and!49209 () Bool)

(assert (=> start!112164 (= tp!107314 b_and!49209)))

(declare-fun b!1328400 () Bool)

(declare-fun e!757396 () Bool)

(assert (=> b!1328400 (= e!757396 false)))

(declare-datatypes ((V!53729 0))(
  ( (V!53730 (val!18309 Int)) )
))
(declare-datatypes ((ValueCell!17336 0))(
  ( (ValueCellFull!17336 (v!20946 V!53729)) (EmptyCell!17336) )
))
(declare-datatypes ((array!89832 0))(
  ( (array!89833 (arr!43382 (Array (_ BitVec 32) ValueCell!17336)) (size!43932 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89832)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89834 0))(
  ( (array!89835 (arr!43383 (Array (_ BitVec 32) (_ BitVec 64))) (size!43933 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89834)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!590836 () Bool)

(declare-fun minValue!1262 () V!53729)

(declare-fun zeroValue!1262 () V!53729)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23566 0))(
  ( (tuple2!23567 (_1!11794 (_ BitVec 64)) (_2!11794 V!53729)) )
))
(declare-datatypes ((List!30723 0))(
  ( (Nil!30720) (Cons!30719 (h!31928 tuple2!23566) (t!44729 List!30723)) )
))
(declare-datatypes ((ListLongMap!21223 0))(
  ( (ListLongMap!21224 (toList!10627 List!30723)) )
))
(declare-fun contains!8791 (ListLongMap!21223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5618 (array!89834 array!89832 (_ BitVec 32) (_ BitVec 32) V!53729 V!53729 (_ BitVec 32) Int) ListLongMap!21223)

(assert (=> b!1328400 (= lt!590836 (contains!8791 (getCurrentListMap!5618 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1328401 () Bool)

(declare-fun e!757393 () Bool)

(declare-fun tp_is_empty!36469 () Bool)

(assert (=> b!1328401 (= e!757393 tp_is_empty!36469)))

(declare-fun b!1328403 () Bool)

(declare-fun res!881386 () Bool)

(assert (=> b!1328403 (=> (not res!881386) (not e!757396))))

(assert (=> b!1328403 (= res!881386 (and (= (size!43932 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43933 _keys!1590) (size!43932 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328404 () Bool)

(declare-fun res!881387 () Bool)

(assert (=> b!1328404 (=> (not res!881387) (not e!757396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89834 (_ BitVec 32)) Bool)

(assert (=> b!1328404 (= res!881387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328405 () Bool)

(declare-fun e!757392 () Bool)

(declare-fun mapRes!56377 () Bool)

(assert (=> b!1328405 (= e!757392 (and e!757393 mapRes!56377))))

(declare-fun condMapEmpty!56377 () Bool)

(declare-fun mapDefault!56377 () ValueCell!17336)

