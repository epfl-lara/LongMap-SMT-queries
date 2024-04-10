; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83758 () Bool)

(assert start!83758)

(declare-fun b_free!19567 () Bool)

(declare-fun b_next!19567 () Bool)

(assert (=> start!83758 (= b_free!19567 (not b_next!19567))))

(declare-fun tp!68143 () Bool)

(declare-fun b_and!31223 () Bool)

(assert (=> start!83758 (= tp!68143 b_and!31223)))

(declare-fun mapNonEmpty!35870 () Bool)

(declare-fun mapRes!35870 () Bool)

(declare-fun tp!68142 () Bool)

(declare-fun e!551436 () Bool)

(assert (=> mapNonEmpty!35870 (= mapRes!35870 (and tp!68142 e!551436))))

(declare-fun mapKey!35870 () (_ BitVec 32))

(declare-datatypes ((V!35065 0))(
  ( (V!35066 (val!11331 Int)) )
))
(declare-datatypes ((ValueCell!10799 0))(
  ( (ValueCellFull!10799 (v!13893 V!35065)) (EmptyCell!10799) )
))
(declare-datatypes ((array!61149 0))(
  ( (array!61150 (arr!29432 (Array (_ BitVec 32) ValueCell!10799)) (size!29911 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61149)

(declare-fun mapValue!35870 () ValueCell!10799)

(declare-fun mapRest!35870 () (Array (_ BitVec 32) ValueCell!10799))

(assert (=> mapNonEmpty!35870 (= (arr!29432 _values!1278) (store mapRest!35870 mapKey!35870 mapValue!35870))))

(declare-fun b!978045 () Bool)

(declare-fun res!654539 () Bool)

(declare-fun e!551433 () Bool)

(assert (=> b!978045 (=> (not res!654539) (not e!551433))))

(declare-datatypes ((array!61151 0))(
  ( (array!61152 (arr!29433 (Array (_ BitVec 32) (_ BitVec 64))) (size!29912 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61151)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61151 (_ BitVec 32)) Bool)

(assert (=> b!978045 (= res!654539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!654535 () Bool)

(assert (=> start!83758 (=> (not res!654535) (not e!551433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83758 (= res!654535 (validMask!0 mask!1948))))

(assert (=> start!83758 e!551433))

(assert (=> start!83758 true))

(declare-fun tp_is_empty!22561 () Bool)

(assert (=> start!83758 tp_is_empty!22561))

(declare-fun e!551432 () Bool)

(declare-fun array_inv!22751 (array!61149) Bool)

(assert (=> start!83758 (and (array_inv!22751 _values!1278) e!551432)))

(assert (=> start!83758 tp!68143))

(declare-fun array_inv!22752 (array!61151) Bool)

(assert (=> start!83758 (array_inv!22752 _keys!1544)))

(declare-fun b!978046 () Bool)

(declare-fun e!551435 () Bool)

(assert (=> b!978046 (= e!551432 (and e!551435 mapRes!35870))))

(declare-fun condMapEmpty!35870 () Bool)

(declare-fun mapDefault!35870 () ValueCell!10799)

