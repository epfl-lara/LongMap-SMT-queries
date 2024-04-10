; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112192 () Bool)

(assert start!112192)

(declare-fun b_free!30587 () Bool)

(declare-fun b_next!30587 () Bool)

(assert (=> start!112192 (= b_free!30587 (not b_next!30587))))

(declare-fun tp!107398 () Bool)

(declare-fun b_and!49237 () Bool)

(assert (=> start!112192 (= tp!107398 b_and!49237)))

(declare-fun mapNonEmpty!56419 () Bool)

(declare-fun mapRes!56419 () Bool)

(declare-fun tp!107397 () Bool)

(declare-fun e!757603 () Bool)

(assert (=> mapNonEmpty!56419 (= mapRes!56419 (and tp!107397 e!757603))))

(declare-datatypes ((V!53765 0))(
  ( (V!53766 (val!18323 Int)) )
))
(declare-datatypes ((ValueCell!17350 0))(
  ( (ValueCellFull!17350 (v!20960 V!53765)) (EmptyCell!17350) )
))
(declare-datatypes ((array!89886 0))(
  ( (array!89887 (arr!43409 (Array (_ BitVec 32) ValueCell!17350)) (size!43959 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89886)

(declare-fun mapValue!56419 () ValueCell!17350)

(declare-fun mapRest!56419 () (Array (_ BitVec 32) ValueCell!17350))

(declare-fun mapKey!56419 () (_ BitVec 32))

(assert (=> mapNonEmpty!56419 (= (arr!43409 _values!1320) (store mapRest!56419 mapKey!56419 mapValue!56419))))

(declare-fun b!1328736 () Bool)

(declare-fun e!757602 () Bool)

(declare-fun tp_is_empty!36497 () Bool)

(assert (=> b!1328736 (= e!757602 tp_is_empty!36497)))

(declare-fun b!1328737 () Bool)

(assert (=> b!1328737 (= e!757603 tp_is_empty!36497)))

(declare-fun b!1328738 () Bool)

(declare-fun res!881597 () Bool)

(declare-fun e!757606 () Bool)

(assert (=> b!1328738 (=> (not res!881597) (not e!757606))))

(declare-datatypes ((array!89888 0))(
  ( (array!89889 (arr!43410 (Array (_ BitVec 32) (_ BitVec 64))) (size!43960 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89888)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89888 (_ BitVec 32)) Bool)

(assert (=> b!1328738 (= res!881597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328739 () Bool)

(assert (=> b!1328739 (= e!757606 false)))

(declare-fun lt!590878 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53765)

(declare-fun zeroValue!1262 () V!53765)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23584 0))(
  ( (tuple2!23585 (_1!11803 (_ BitVec 64)) (_2!11803 V!53765)) )
))
(declare-datatypes ((List!30741 0))(
  ( (Nil!30738) (Cons!30737 (h!31946 tuple2!23584) (t!44747 List!30741)) )
))
(declare-datatypes ((ListLongMap!21241 0))(
  ( (ListLongMap!21242 (toList!10636 List!30741)) )
))
(declare-fun contains!8800 (ListLongMap!21241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5627 (array!89888 array!89886 (_ BitVec 32) (_ BitVec 32) V!53765 V!53765 (_ BitVec 32) Int) ListLongMap!21241)

(assert (=> b!1328739 (= lt!590878 (contains!8800 (getCurrentListMap!5627 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1328740 () Bool)

(declare-fun res!881598 () Bool)

(assert (=> b!1328740 (=> (not res!881598) (not e!757606))))

(assert (=> b!1328740 (= res!881598 (and (= (size!43959 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43960 _keys!1590) (size!43959 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!881595 () Bool)

(assert (=> start!112192 (=> (not res!881595) (not e!757606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112192 (= res!881595 (validMask!0 mask!1998))))

(assert (=> start!112192 e!757606))

(declare-fun e!757605 () Bool)

(declare-fun array_inv!32753 (array!89886) Bool)

(assert (=> start!112192 (and (array_inv!32753 _values!1320) e!757605)))

(assert (=> start!112192 true))

(declare-fun array_inv!32754 (array!89888) Bool)

(assert (=> start!112192 (array_inv!32754 _keys!1590)))

(assert (=> start!112192 tp!107398))

(assert (=> start!112192 tp_is_empty!36497))

(declare-fun b!1328741 () Bool)

(declare-fun res!881594 () Bool)

(assert (=> b!1328741 (=> (not res!881594) (not e!757606))))

(declare-datatypes ((List!30742 0))(
  ( (Nil!30739) (Cons!30738 (h!31947 (_ BitVec 64)) (t!44748 List!30742)) )
))
(declare-fun arrayNoDuplicates!0 (array!89888 (_ BitVec 32) List!30742) Bool)

(assert (=> b!1328741 (= res!881594 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30739))))

(declare-fun b!1328742 () Bool)

(declare-fun res!881596 () Bool)

(assert (=> b!1328742 (=> (not res!881596) (not e!757606))))

(assert (=> b!1328742 (= res!881596 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43960 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328743 () Bool)

(assert (=> b!1328743 (= e!757605 (and e!757602 mapRes!56419))))

(declare-fun condMapEmpty!56419 () Bool)

(declare-fun mapDefault!56419 () ValueCell!17350)

