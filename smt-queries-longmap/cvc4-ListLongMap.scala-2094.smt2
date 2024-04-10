; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35736 () Bool)

(assert start!35736)

(declare-fun b!358953 () Bool)

(declare-fun e!219793 () Bool)

(declare-fun tp_is_empty!8189 () Bool)

(assert (=> b!358953 (= e!219793 tp_is_empty!8189)))

(declare-fun mapIsEmpty!13791 () Bool)

(declare-fun mapRes!13791 () Bool)

(assert (=> mapIsEmpty!13791 mapRes!13791))

(declare-fun b!358954 () Bool)

(declare-fun res!199512 () Bool)

(declare-fun e!219796 () Bool)

(assert (=> b!358954 (=> (not res!199512) (not e!219796))))

(declare-datatypes ((array!19937 0))(
  ( (array!19938 (arr!9462 (Array (_ BitVec 32) (_ BitVec 64))) (size!9814 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19937)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!358954 (= res!199512 (= (select (arr!9462 _keys!1456) from!1805) k!1077))))

(declare-fun b!358955 () Bool)

(declare-fun res!199507 () Bool)

(assert (=> b!358955 (=> (not res!199507) (not e!219796))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11895 0))(
  ( (V!11896 (val!4139 Int)) )
))
(declare-datatypes ((ValueCell!3751 0))(
  ( (ValueCellFull!3751 (v!6333 V!11895)) (EmptyCell!3751) )
))
(declare-datatypes ((array!19939 0))(
  ( (array!19940 (arr!9463 (Array (_ BitVec 32) ValueCell!3751)) (size!9815 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19939)

(assert (=> b!358955 (= res!199507 (and (= (size!9815 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9814 _keys!1456) (size!9815 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199506 () Bool)

(assert (=> start!35736 (=> (not res!199506) (not e!219796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35736 (= res!199506 (validMask!0 mask!1842))))

(assert (=> start!35736 e!219796))

(assert (=> start!35736 true))

(declare-fun array_inv!6960 (array!19937) Bool)

(assert (=> start!35736 (array_inv!6960 _keys!1456)))

(declare-fun e!219797 () Bool)

(declare-fun array_inv!6961 (array!19939) Bool)

(assert (=> start!35736 (and (array_inv!6961 _values!1208) e!219797)))

(declare-fun mapNonEmpty!13791 () Bool)

(declare-fun tp!27849 () Bool)

(declare-fun e!219795 () Bool)

(assert (=> mapNonEmpty!13791 (= mapRes!13791 (and tp!27849 e!219795))))

(declare-fun mapKey!13791 () (_ BitVec 32))

(declare-fun mapValue!13791 () ValueCell!3751)

(declare-fun mapRest!13791 () (Array (_ BitVec 32) ValueCell!3751))

(assert (=> mapNonEmpty!13791 (= (arr!9463 _values!1208) (store mapRest!13791 mapKey!13791 mapValue!13791))))

(declare-fun b!358956 () Bool)

(assert (=> b!358956 (= e!219795 tp_is_empty!8189)))

(declare-fun b!358957 () Bool)

(assert (=> b!358957 (= e!219797 (and e!219793 mapRes!13791))))

(declare-fun condMapEmpty!13791 () Bool)

(declare-fun mapDefault!13791 () ValueCell!3751)

