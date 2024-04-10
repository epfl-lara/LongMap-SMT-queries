; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83740 () Bool)

(assert start!83740)

(declare-fun b!977776 () Bool)

(declare-fun res!654351 () Bool)

(declare-fun e!551300 () Bool)

(assert (=> b!977776 (=> (not res!654351) (not e!551300))))

(declare-datatypes ((array!61113 0))(
  ( (array!61114 (arr!29414 (Array (_ BitVec 32) (_ BitVec 64))) (size!29893 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61113)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977776 (= res!654351 (validKeyInArray!0 (select (arr!29414 _keys!1544) from!1932)))))

(declare-fun b!977777 () Bool)

(declare-fun res!654353 () Bool)

(assert (=> b!977777 (=> (not res!654353) (not e!551300))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35041 0))(
  ( (V!35042 (val!11322 Int)) )
))
(declare-datatypes ((ValueCell!10790 0))(
  ( (ValueCellFull!10790 (v!13884 V!35041)) (EmptyCell!10790) )
))
(declare-datatypes ((array!61115 0))(
  ( (array!61116 (arr!29415 (Array (_ BitVec 32) ValueCell!10790)) (size!29894 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61115)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977777 (= res!654353 (and (= (size!29894 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29893 _keys!1544) (size!29894 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977778 () Bool)

(declare-fun res!654352 () Bool)

(assert (=> b!977778 (=> (not res!654352) (not e!551300))))

(declare-datatypes ((List!20387 0))(
  ( (Nil!20384) (Cons!20383 (h!21545 (_ BitVec 64)) (t!28902 List!20387)) )
))
(declare-fun arrayNoDuplicates!0 (array!61113 (_ BitVec 32) List!20387) Bool)

(assert (=> b!977778 (= res!654352 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20384))))

(declare-fun b!977779 () Bool)

(declare-fun e!551301 () Bool)

(declare-fun tp_is_empty!22543 () Bool)

(assert (=> b!977779 (= e!551301 tp_is_empty!22543)))

(declare-fun b!977780 () Bool)

(declare-fun res!654356 () Bool)

(assert (=> b!977780 (=> (not res!654356) (not e!551300))))

(assert (=> b!977780 (= res!654356 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29893 _keys!1544))))))

(declare-fun b!977782 () Bool)

(assert (=> b!977782 (= e!551300 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!35843 () Bool)

(declare-fun mapRes!35843 () Bool)

(declare-fun tp!68095 () Bool)

(declare-fun e!551298 () Bool)

(assert (=> mapNonEmpty!35843 (= mapRes!35843 (and tp!68095 e!551298))))

(declare-fun mapRest!35843 () (Array (_ BitVec 32) ValueCell!10790))

(declare-fun mapValue!35843 () ValueCell!10790)

(declare-fun mapKey!35843 () (_ BitVec 32))

(assert (=> mapNonEmpty!35843 (= (arr!29415 _values!1278) (store mapRest!35843 mapKey!35843 mapValue!35843))))

(declare-fun b!977783 () Bool)

(declare-fun res!654354 () Bool)

(assert (=> b!977783 (=> (not res!654354) (not e!551300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61113 (_ BitVec 32)) Bool)

(assert (=> b!977783 (= res!654354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977781 () Bool)

(declare-fun e!551299 () Bool)

(assert (=> b!977781 (= e!551299 (and e!551301 mapRes!35843))))

(declare-fun condMapEmpty!35843 () Bool)

(declare-fun mapDefault!35843 () ValueCell!10790)

