; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83744 () Bool)

(assert start!83744)

(declare-fun b!977830 () Bool)

(declare-fun res!654391 () Bool)

(declare-fun e!551327 () Bool)

(assert (=> b!977830 (=> (not res!654391) (not e!551327))))

(declare-datatypes ((array!61121 0))(
  ( (array!61122 (arr!29418 (Array (_ BitVec 32) (_ BitVec 64))) (size!29897 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61121)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977830 (= res!654391 (validKeyInArray!0 (select (arr!29418 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35849 () Bool)

(declare-fun mapRes!35849 () Bool)

(assert (=> mapIsEmpty!35849 mapRes!35849))

(declare-fun mapNonEmpty!35849 () Bool)

(declare-fun tp!68101 () Bool)

(declare-fun e!551330 () Bool)

(assert (=> mapNonEmpty!35849 (= mapRes!35849 (and tp!68101 e!551330))))

(declare-datatypes ((V!35045 0))(
  ( (V!35046 (val!11324 Int)) )
))
(declare-datatypes ((ValueCell!10792 0))(
  ( (ValueCellFull!10792 (v!13886 V!35045)) (EmptyCell!10792) )
))
(declare-datatypes ((array!61123 0))(
  ( (array!61124 (arr!29419 (Array (_ BitVec 32) ValueCell!10792)) (size!29898 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61123)

(declare-fun mapRest!35849 () (Array (_ BitVec 32) ValueCell!10792))

(declare-fun mapValue!35849 () ValueCell!10792)

(declare-fun mapKey!35849 () (_ BitVec 32))

(assert (=> mapNonEmpty!35849 (= (arr!29419 _values!1278) (store mapRest!35849 mapKey!35849 mapValue!35849))))

(declare-fun b!977831 () Bool)

(declare-fun res!654389 () Bool)

(assert (=> b!977831 (=> (not res!654389) (not e!551327))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977831 (= res!654389 (and (= (size!29898 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29897 _keys!1544) (size!29898 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977832 () Bool)

(declare-fun res!654392 () Bool)

(assert (=> b!977832 (=> (not res!654392) (not e!551327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61121 (_ BitVec 32)) Bool)

(assert (=> b!977832 (= res!654392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977833 () Bool)

(declare-fun e!551328 () Bool)

(declare-fun tp_is_empty!22547 () Bool)

(assert (=> b!977833 (= e!551328 tp_is_empty!22547)))

(declare-fun b!977834 () Bool)

(assert (=> b!977834 (= e!551327 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!977835 () Bool)

(declare-fun res!654387 () Bool)

(assert (=> b!977835 (=> (not res!654387) (not e!551327))))

(declare-datatypes ((List!20389 0))(
  ( (Nil!20386) (Cons!20385 (h!21547 (_ BitVec 64)) (t!28904 List!20389)) )
))
(declare-fun arrayNoDuplicates!0 (array!61121 (_ BitVec 32) List!20389) Bool)

(assert (=> b!977835 (= res!654387 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20386))))

(declare-fun b!977836 () Bool)

(assert (=> b!977836 (= e!551330 tp_is_empty!22547)))

(declare-fun b!977837 () Bool)

(declare-fun res!654390 () Bool)

(assert (=> b!977837 (=> (not res!654390) (not e!551327))))

(assert (=> b!977837 (= res!654390 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29897 _keys!1544))))))

(declare-fun b!977838 () Bool)

(declare-fun e!551329 () Bool)

(assert (=> b!977838 (= e!551329 (and e!551328 mapRes!35849))))

(declare-fun condMapEmpty!35849 () Bool)

(declare-fun mapDefault!35849 () ValueCell!10792)

