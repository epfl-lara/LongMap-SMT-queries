; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83878 () Bool)

(assert start!83878)

(declare-fun b_free!19687 () Bool)

(declare-fun b_next!19687 () Bool)

(assert (=> start!83878 (= b_free!19687 (not b_next!19687))))

(declare-fun tp!68503 () Bool)

(declare-fun b_and!31463 () Bool)

(assert (=> start!83878 (= tp!68503 b_and!31463)))

(declare-fun b!980066 () Bool)

(declare-fun e!552435 () Bool)

(declare-fun tp_is_empty!22681 () Bool)

(assert (=> b!980066 (= e!552435 tp_is_empty!22681)))

(declare-fun b!980067 () Bool)

(declare-fun res!655899 () Bool)

(declare-fun e!552438 () Bool)

(assert (=> b!980067 (=> (not res!655899) (not e!552438))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980067 (= res!655899 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!655896 () Bool)

(assert (=> start!83878 (=> (not res!655896) (not e!552438))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83878 (= res!655896 (validMask!0 mask!1948))))

(assert (=> start!83878 e!552438))

(assert (=> start!83878 true))

(assert (=> start!83878 tp_is_empty!22681))

(declare-datatypes ((V!35225 0))(
  ( (V!35226 (val!11391 Int)) )
))
(declare-datatypes ((ValueCell!10859 0))(
  ( (ValueCellFull!10859 (v!13953 V!35225)) (EmptyCell!10859) )
))
(declare-datatypes ((array!61373 0))(
  ( (array!61374 (arr!29544 (Array (_ BitVec 32) ValueCell!10859)) (size!30023 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61373)

(declare-fun e!552437 () Bool)

(declare-fun array_inv!22841 (array!61373) Bool)

(assert (=> start!83878 (and (array_inv!22841 _values!1278) e!552437)))

(assert (=> start!83878 tp!68503))

(declare-datatypes ((array!61375 0))(
  ( (array!61376 (arr!29545 (Array (_ BitVec 32) (_ BitVec 64))) (size!30024 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61375)

(declare-fun array_inv!22842 (array!61375) Bool)

(assert (=> start!83878 (array_inv!22842 _keys!1544)))

(declare-fun b!980068 () Bool)

(declare-fun res!655897 () Bool)

(assert (=> b!980068 (=> (not res!655897) (not e!552438))))

(declare-datatypes ((List!20478 0))(
  ( (Nil!20475) (Cons!20474 (h!21636 (_ BitVec 64)) (t!29121 List!20478)) )
))
(declare-fun arrayNoDuplicates!0 (array!61375 (_ BitVec 32) List!20478) Bool)

(assert (=> b!980068 (= res!655897 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20475))))

(declare-fun b!980069 () Bool)

(declare-fun res!655900 () Bool)

(assert (=> b!980069 (=> (not res!655900) (not e!552438))))

(assert (=> b!980069 (= res!655900 (and (= (size!30023 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30024 _keys!1544) (size!30023 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980070 () Bool)

(declare-fun res!655894 () Bool)

(assert (=> b!980070 (=> (not res!655894) (not e!552438))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980070 (= res!655894 (validKeyInArray!0 (select (arr!29545 _keys!1544) from!1932)))))

(declare-fun b!980071 () Bool)

(declare-fun res!655898 () Bool)

(assert (=> b!980071 (=> (not res!655898) (not e!552438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61375 (_ BitVec 32)) Bool)

(assert (=> b!980071 (= res!655898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980072 () Bool)

(declare-fun res!655901 () Bool)

(assert (=> b!980072 (=> (not res!655901) (not e!552438))))

(assert (=> b!980072 (= res!655901 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30024 _keys!1544))))))

(declare-fun b!980073 () Bool)

(declare-fun mapRes!36050 () Bool)

(assert (=> b!980073 (= e!552437 (and e!552435 mapRes!36050))))

(declare-fun condMapEmpty!36050 () Bool)

(declare-fun mapDefault!36050 () ValueCell!10859)

