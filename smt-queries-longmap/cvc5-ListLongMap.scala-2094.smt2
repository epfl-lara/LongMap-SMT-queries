; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35732 () Bool)

(assert start!35732)

(declare-fun b!358887 () Bool)

(declare-fun e!219763 () Bool)

(declare-datatypes ((array!19929 0))(
  ( (array!19930 (arr!9458 (Array (_ BitVec 32) (_ BitVec 64))) (size!9810 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19929)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358887 (= e!219763 (not (validKeyInArray!0 (select (arr!9458 _keys!1456) from!1805))))))

(declare-fun b!358888 () Bool)

(declare-fun e!219766 () Bool)

(declare-fun tp_is_empty!8185 () Bool)

(assert (=> b!358888 (= e!219766 tp_is_empty!8185)))

(declare-fun b!358889 () Bool)

(declare-fun e!219765 () Bool)

(assert (=> b!358889 (= e!219765 tp_is_empty!8185)))

(declare-fun b!358890 () Bool)

(declare-fun res!199465 () Bool)

(assert (=> b!358890 (=> (not res!199465) (not e!219763))))

(declare-datatypes ((List!5448 0))(
  ( (Nil!5445) (Cons!5444 (h!6300 (_ BitVec 64)) (t!10598 List!5448)) )
))
(declare-fun arrayNoDuplicates!0 (array!19929 (_ BitVec 32) List!5448) Bool)

(assert (=> b!358890 (= res!199465 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5445))))

(declare-fun res!199464 () Bool)

(assert (=> start!35732 (=> (not res!199464) (not e!219763))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35732 (= res!199464 (validMask!0 mask!1842))))

(assert (=> start!35732 e!219763))

(assert (=> start!35732 true))

(declare-fun array_inv!6956 (array!19929) Bool)

(assert (=> start!35732 (array_inv!6956 _keys!1456)))

(declare-datatypes ((V!11891 0))(
  ( (V!11892 (val!4137 Int)) )
))
(declare-datatypes ((ValueCell!3749 0))(
  ( (ValueCellFull!3749 (v!6331 V!11891)) (EmptyCell!3749) )
))
(declare-datatypes ((array!19931 0))(
  ( (array!19932 (arr!9459 (Array (_ BitVec 32) ValueCell!3749)) (size!9811 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19931)

(declare-fun e!219764 () Bool)

(declare-fun array_inv!6957 (array!19931) Bool)

(assert (=> start!35732 (and (array_inv!6957 _values!1208) e!219764)))

(declare-fun b!358891 () Bool)

(declare-fun res!199458 () Bool)

(assert (=> b!358891 (=> (not res!199458) (not e!219763))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358891 (= res!199458 (and (= (size!9811 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9810 _keys!1456) (size!9811 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358892 () Bool)

(declare-fun res!199460 () Bool)

(assert (=> b!358892 (=> (not res!199460) (not e!219763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19929 (_ BitVec 32)) Bool)

(assert (=> b!358892 (= res!199460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358893 () Bool)

(declare-fun res!199459 () Bool)

(assert (=> b!358893 (=> (not res!199459) (not e!219763))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!358893 (= res!199459 (validKeyInArray!0 k!1077))))

(declare-fun mapNonEmpty!13785 () Bool)

(declare-fun mapRes!13785 () Bool)

(declare-fun tp!27843 () Bool)

(assert (=> mapNonEmpty!13785 (= mapRes!13785 (and tp!27843 e!219765))))

(declare-fun mapRest!13785 () (Array (_ BitVec 32) ValueCell!3749))

(declare-fun mapKey!13785 () (_ BitVec 32))

(declare-fun mapValue!13785 () ValueCell!3749)

(assert (=> mapNonEmpty!13785 (= (arr!9459 _values!1208) (store mapRest!13785 mapKey!13785 mapValue!13785))))

(declare-fun b!358894 () Bool)

(declare-fun res!199463 () Bool)

(assert (=> b!358894 (=> (not res!199463) (not e!219763))))

(assert (=> b!358894 (= res!199463 (= (select (arr!9458 _keys!1456) from!1805) k!1077))))

(declare-fun mapIsEmpty!13785 () Bool)

(assert (=> mapIsEmpty!13785 mapRes!13785))

(declare-fun b!358895 () Bool)

(assert (=> b!358895 (= e!219764 (and e!219766 mapRes!13785))))

(declare-fun condMapEmpty!13785 () Bool)

(declare-fun mapDefault!13785 () ValueCell!3749)

