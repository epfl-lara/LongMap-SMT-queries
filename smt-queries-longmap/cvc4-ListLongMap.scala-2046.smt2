; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35448 () Bool)

(assert start!35448)

(declare-fun b_free!7835 () Bool)

(declare-fun b_next!7835 () Bool)

(assert (=> start!35448 (= b_free!7835 (not b_next!7835))))

(declare-fun tp!27290 () Bool)

(declare-fun b_and!15077 () Bool)

(assert (=> start!35448 (= tp!27290 b_and!15077)))

(declare-fun b!355029 () Bool)

(declare-fun e!217552 () Bool)

(declare-fun tp_is_empty!7901 () Bool)

(assert (=> b!355029 (= e!217552 tp_is_empty!7901)))

(declare-fun b!355030 () Bool)

(declare-fun res!196880 () Bool)

(declare-fun e!217556 () Bool)

(assert (=> b!355030 (=> (not res!196880) (not e!217556))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-datatypes ((array!19381 0))(
  ( (array!19382 (arr!9184 (Array (_ BitVec 32) (_ BitVec 64))) (size!9536 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19381)

(assert (=> b!355030 (= res!196880 (= (select (arr!9184 _keys!1456) from!1805) k!1077))))

(declare-fun b!355031 () Bool)

(declare-fun res!196883 () Bool)

(assert (=> b!355031 (=> (not res!196883) (not e!217556))))

(declare-fun arrayContainsKey!0 (array!19381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355031 (= res!196883 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun mapIsEmpty!13359 () Bool)

(declare-fun mapRes!13359 () Bool)

(assert (=> mapIsEmpty!13359 mapRes!13359))

(declare-fun b!355032 () Bool)

(declare-fun res!196882 () Bool)

(assert (=> b!355032 (=> (not res!196882) (not e!217556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355032 (= res!196882 (validKeyInArray!0 k!1077))))

(declare-fun b!355033 () Bool)

(declare-fun res!196877 () Bool)

(assert (=> b!355033 (=> (not res!196877) (not e!217556))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19381 (_ BitVec 32)) Bool)

(assert (=> b!355033 (= res!196877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355034 () Bool)

(declare-fun res!196881 () Bool)

(assert (=> b!355034 (=> (not res!196881) (not e!217556))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11511 0))(
  ( (V!11512 (val!3995 Int)) )
))
(declare-datatypes ((ValueCell!3607 0))(
  ( (ValueCellFull!3607 (v!6189 V!11511)) (EmptyCell!3607) )
))
(declare-datatypes ((array!19383 0))(
  ( (array!19384 (arr!9185 (Array (_ BitVec 32) ValueCell!3607)) (size!9537 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19383)

(assert (=> b!355034 (= res!196881 (and (= (size!9537 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9536 _keys!1456) (size!9537 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355028 () Bool)

(assert (=> b!355028 (= e!217556 (not true))))

(declare-fun minValue!1150 () V!11511)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11511)

(declare-datatypes ((tuple2!5676 0))(
  ( (tuple2!5677 (_1!2849 (_ BitVec 64)) (_2!2849 V!11511)) )
))
(declare-datatypes ((List!5319 0))(
  ( (Nil!5316) (Cons!5315 (h!6171 tuple2!5676) (t!10469 List!5319)) )
))
(declare-datatypes ((ListLongMap!4589 0))(
  ( (ListLongMap!4590 (toList!2310 List!5319)) )
))
(declare-fun contains!2390 (ListLongMap!4589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1831 (array!19381 array!19383 (_ BitVec 32) (_ BitVec 32) V!11511 V!11511 (_ BitVec 32) Int) ListLongMap!4589)

(assert (=> b!355028 (contains!2390 (getCurrentListMap!1831 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9184 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10942 0))(
  ( (Unit!10943) )
))
(declare-fun lt!165767 () Unit!10942)

(declare-fun lemmaValidKeyInArrayIsInListMap!188 (array!19381 array!19383 (_ BitVec 32) (_ BitVec 32) V!11511 V!11511 (_ BitVec 32) Int) Unit!10942)

(assert (=> b!355028 (= lt!165767 (lemmaValidKeyInArrayIsInListMap!188 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun res!196885 () Bool)

(assert (=> start!35448 (=> (not res!196885) (not e!217556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35448 (= res!196885 (validMask!0 mask!1842))))

(assert (=> start!35448 e!217556))

(assert (=> start!35448 tp_is_empty!7901))

(assert (=> start!35448 true))

(assert (=> start!35448 tp!27290))

(declare-fun array_inv!6750 (array!19381) Bool)

(assert (=> start!35448 (array_inv!6750 _keys!1456)))

(declare-fun e!217553 () Bool)

(declare-fun array_inv!6751 (array!19383) Bool)

(assert (=> start!35448 (and (array_inv!6751 _values!1208) e!217553)))

(declare-fun b!355035 () Bool)

(declare-fun res!196884 () Bool)

(assert (=> b!355035 (=> (not res!196884) (not e!217556))))

(assert (=> b!355035 (= res!196884 (validKeyInArray!0 (select (arr!9184 _keys!1456) from!1805)))))

(declare-fun b!355036 () Bool)

(declare-fun res!196879 () Bool)

(assert (=> b!355036 (=> (not res!196879) (not e!217556))))

(assert (=> b!355036 (= res!196879 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9536 _keys!1456))))))

(declare-fun b!355037 () Bool)

(declare-fun res!196878 () Bool)

(assert (=> b!355037 (=> (not res!196878) (not e!217556))))

(declare-datatypes ((List!5320 0))(
  ( (Nil!5317) (Cons!5316 (h!6172 (_ BitVec 64)) (t!10470 List!5320)) )
))
(declare-fun arrayNoDuplicates!0 (array!19381 (_ BitVec 32) List!5320) Bool)

(assert (=> b!355037 (= res!196878 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5317))))

(declare-fun b!355038 () Bool)

(declare-fun e!217554 () Bool)

(assert (=> b!355038 (= e!217554 tp_is_empty!7901)))

(declare-fun b!355039 () Bool)

(assert (=> b!355039 (= e!217553 (and e!217554 mapRes!13359))))

(declare-fun condMapEmpty!13359 () Bool)

(declare-fun mapDefault!13359 () ValueCell!3607)

