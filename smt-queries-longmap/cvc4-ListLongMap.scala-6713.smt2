; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84254 () Bool)

(assert start!84254)

(declare-fun b_free!19955 () Bool)

(declare-fun b_next!19955 () Bool)

(assert (=> start!84254 (= b_free!19955 (not b_next!19955))))

(declare-fun tp!69468 () Bool)

(declare-fun b_and!31987 () Bool)

(assert (=> start!84254 (= tp!69468 b_and!31987)))

(declare-fun b!985752 () Bool)

(declare-fun res!659637 () Bool)

(declare-fun e!555639 () Bool)

(assert (=> b!985752 (=> (not res!659637) (not e!555639))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35725 0))(
  ( (V!35726 (val!11579 Int)) )
))
(declare-datatypes ((ValueCell!11047 0))(
  ( (ValueCellFull!11047 (v!14141 V!35725)) (EmptyCell!11047) )
))
(declare-datatypes ((array!62089 0))(
  ( (array!62090 (arr!29902 (Array (_ BitVec 32) ValueCell!11047)) (size!30381 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62089)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62091 0))(
  ( (array!62092 (arr!29903 (Array (_ BitVec 32) (_ BitVec 64))) (size!30382 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62091)

(assert (=> b!985752 (= res!659637 (and (= (size!30381 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30382 _keys!1544) (size!30381 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985753 () Bool)

(declare-fun e!555637 () Bool)

(declare-fun tp_is_empty!23057 () Bool)

(assert (=> b!985753 (= e!555637 tp_is_empty!23057)))

(declare-fun b!985754 () Bool)

(declare-fun res!659638 () Bool)

(assert (=> b!985754 (=> (not res!659638) (not e!555639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62091 (_ BitVec 32)) Bool)

(assert (=> b!985754 (= res!659638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985755 () Bool)

(declare-fun res!659632 () Bool)

(assert (=> b!985755 (=> (not res!659632) (not e!555639))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985755 (= res!659632 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30382 _keys!1544))))))

(declare-fun b!985756 () Bool)

(declare-fun res!659633 () Bool)

(assert (=> b!985756 (=> (not res!659633) (not e!555639))))

(declare-datatypes ((List!20713 0))(
  ( (Nil!20710) (Cons!20709 (h!21871 (_ BitVec 64)) (t!29612 List!20713)) )
))
(declare-fun arrayNoDuplicates!0 (array!62091 (_ BitVec 32) List!20713) Bool)

(assert (=> b!985756 (= res!659633 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20710))))

(declare-fun b!985757 () Bool)

(declare-fun res!659634 () Bool)

(assert (=> b!985757 (=> (not res!659634) (not e!555639))))

(assert (=> b!985757 (= res!659634 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985758 () Bool)

(declare-fun e!555638 () Bool)

(declare-fun e!555640 () Bool)

(declare-fun mapRes!36614 () Bool)

(assert (=> b!985758 (= e!555638 (and e!555640 mapRes!36614))))

(declare-fun condMapEmpty!36614 () Bool)

(declare-fun mapDefault!36614 () ValueCell!11047)

