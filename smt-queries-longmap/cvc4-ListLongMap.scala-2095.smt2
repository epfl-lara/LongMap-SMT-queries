; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35742 () Bool)

(assert start!35742)

(declare-fun b_free!7925 () Bool)

(declare-fun b_next!7925 () Bool)

(assert (=> start!35742 (= b_free!7925 (not b_next!7925))))

(declare-fun tp!27867 () Bool)

(declare-fun b_and!15167 () Bool)

(assert (=> start!35742 (= tp!27867 b_and!15167)))

(declare-fun b!359060 () Bool)

(declare-fun res!199592 () Bool)

(declare-fun e!219838 () Bool)

(assert (=> b!359060 (=> (not res!199592) (not e!219838))))

(declare-datatypes ((array!19949 0))(
  ( (array!19950 (arr!9468 (Array (_ BitVec 32) (_ BitVec 64))) (size!9820 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19949)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359060 (= res!199592 (validKeyInArray!0 (select (arr!9468 _keys!1456) from!1805)))))

(declare-fun res!199589 () Bool)

(assert (=> start!35742 (=> (not res!199589) (not e!219838))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35742 (= res!199589 (validMask!0 mask!1842))))

(assert (=> start!35742 e!219838))

(declare-fun tp_is_empty!8195 () Bool)

(assert (=> start!35742 tp_is_empty!8195))

(assert (=> start!35742 true))

(assert (=> start!35742 tp!27867))

(declare-fun array_inv!6966 (array!19949) Bool)

(assert (=> start!35742 (array_inv!6966 _keys!1456)))

(declare-datatypes ((V!11903 0))(
  ( (V!11904 (val!4142 Int)) )
))
(declare-datatypes ((ValueCell!3754 0))(
  ( (ValueCellFull!3754 (v!6336 V!11903)) (EmptyCell!3754) )
))
(declare-datatypes ((array!19951 0))(
  ( (array!19952 (arr!9469 (Array (_ BitVec 32) ValueCell!3754)) (size!9821 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19951)

(declare-fun e!219841 () Bool)

(declare-fun array_inv!6967 (array!19951) Bool)

(assert (=> start!35742 (and (array_inv!6967 _values!1208) e!219841)))

(declare-fun b!359061 () Bool)

(declare-fun e!219839 () Bool)

(assert (=> b!359061 (= e!219839 tp_is_empty!8195)))

(declare-fun b!359062 () Bool)

(declare-fun res!199593 () Bool)

(assert (=> b!359062 (=> (not res!199593) (not e!219838))))

(declare-datatypes ((List!5453 0))(
  ( (Nil!5450) (Cons!5449 (h!6305 (_ BitVec 64)) (t!10603 List!5453)) )
))
(declare-fun arrayNoDuplicates!0 (array!19949 (_ BitVec 32) List!5453) Bool)

(assert (=> b!359062 (= res!199593 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5450))))

(declare-fun b!359063 () Bool)

(declare-fun res!199591 () Bool)

(assert (=> b!359063 (=> (not res!199591) (not e!219838))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359063 (= res!199591 (and (= (size!9821 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9820 _keys!1456) (size!9821 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359064 () Bool)

(declare-datatypes ((tuple2!5732 0))(
  ( (tuple2!5733 (_1!2877 (_ BitVec 64)) (_2!2877 V!11903)) )
))
(declare-datatypes ((List!5454 0))(
  ( (Nil!5451) (Cons!5450 (h!6306 tuple2!5732) (t!10604 List!5454)) )
))
(declare-datatypes ((ListLongMap!4645 0))(
  ( (ListLongMap!4646 (toList!2338 List!5454)) )
))
(declare-fun lt!166279 () ListLongMap!4645)

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun contains!2418 (ListLongMap!4645 (_ BitVec 64)) Bool)

(assert (=> b!359064 (= e!219838 (not (contains!2418 lt!166279 k!1077)))))

(assert (=> b!359064 (contains!2418 lt!166279 (select (arr!9468 _keys!1456) from!1805))))

(declare-fun minValue!1150 () V!11903)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11903)

(declare-fun getCurrentListMap!1859 (array!19949 array!19951 (_ BitVec 32) (_ BitVec 32) V!11903 V!11903 (_ BitVec 32) Int) ListLongMap!4645)

(assert (=> b!359064 (= lt!166279 (getCurrentListMap!1859 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216))))

(declare-datatypes ((Unit!11052 0))(
  ( (Unit!11053) )
))
(declare-fun lt!166280 () Unit!11052)

(declare-fun lemmaValidKeyInArrayIsInListMap!200 (array!19949 array!19951 (_ BitVec 32) (_ BitVec 32) V!11903 V!11903 (_ BitVec 32) Int) Unit!11052)

(assert (=> b!359064 (= lt!166280 (lemmaValidKeyInArrayIsInListMap!200 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapNonEmpty!13800 () Bool)

(declare-fun mapRes!13800 () Bool)

(declare-fun tp!27866 () Bool)

(assert (=> mapNonEmpty!13800 (= mapRes!13800 (and tp!27866 e!219839))))

(declare-fun mapKey!13800 () (_ BitVec 32))

(declare-fun mapRest!13800 () (Array (_ BitVec 32) ValueCell!3754))

(declare-fun mapValue!13800 () ValueCell!3754)

(assert (=> mapNonEmpty!13800 (= (arr!9469 _values!1208) (store mapRest!13800 mapKey!13800 mapValue!13800))))

(declare-fun b!359065 () Bool)

(declare-fun res!199588 () Bool)

(assert (=> b!359065 (=> (not res!199588) (not e!219838))))

(assert (=> b!359065 (= res!199588 (= (select (arr!9468 _keys!1456) from!1805) k!1077))))

(declare-fun b!359066 () Bool)

(declare-fun res!199587 () Bool)

(assert (=> b!359066 (=> (not res!199587) (not e!219838))))

(assert (=> b!359066 (= res!199587 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9820 _keys!1456))))))

(declare-fun b!359067 () Bool)

(declare-fun e!219842 () Bool)

(assert (=> b!359067 (= e!219841 (and e!219842 mapRes!13800))))

(declare-fun condMapEmpty!13800 () Bool)

(declare-fun mapDefault!13800 () ValueCell!3754)

