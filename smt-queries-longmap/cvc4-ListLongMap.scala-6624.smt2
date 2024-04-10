; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83720 () Bool)

(assert start!83720)

(declare-fun b!977590 () Bool)

(declare-fun res!654255 () Bool)

(declare-fun e!551150 () Bool)

(assert (=> b!977590 (=> (not res!654255) (not e!551150))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35013 0))(
  ( (V!35014 (val!11312 Int)) )
))
(declare-datatypes ((ValueCell!10780 0))(
  ( (ValueCellFull!10780 (v!13874 V!35013)) (EmptyCell!10780) )
))
(declare-datatypes ((array!61073 0))(
  ( (array!61074 (arr!29394 (Array (_ BitVec 32) ValueCell!10780)) (size!29873 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61073)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61075 0))(
  ( (array!61076 (arr!29395 (Array (_ BitVec 32) (_ BitVec 64))) (size!29874 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61075)

(assert (=> b!977590 (= res!654255 (and (= (size!29873 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29874 _keys!1544) (size!29873 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35813 () Bool)

(declare-fun mapRes!35813 () Bool)

(declare-fun tp!68065 () Bool)

(declare-fun e!551147 () Bool)

(assert (=> mapNonEmpty!35813 (= mapRes!35813 (and tp!68065 e!551147))))

(declare-fun mapValue!35813 () ValueCell!10780)

(declare-fun mapRest!35813 () (Array (_ BitVec 32) ValueCell!10780))

(declare-fun mapKey!35813 () (_ BitVec 32))

(assert (=> mapNonEmpty!35813 (= (arr!29394 _values!1278) (store mapRest!35813 mapKey!35813 mapValue!35813))))

(declare-fun b!977591 () Bool)

(declare-fun res!654257 () Bool)

(assert (=> b!977591 (=> (not res!654257) (not e!551150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61075 (_ BitVec 32)) Bool)

(assert (=> b!977591 (= res!654257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!35813 () Bool)

(assert (=> mapIsEmpty!35813 mapRes!35813))

(declare-fun res!654256 () Bool)

(assert (=> start!83720 (=> (not res!654256) (not e!551150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83720 (= res!654256 (validMask!0 mask!1948))))

(assert (=> start!83720 e!551150))

(assert (=> start!83720 true))

(declare-fun e!551149 () Bool)

(declare-fun array_inv!22725 (array!61073) Bool)

(assert (=> start!83720 (and (array_inv!22725 _values!1278) e!551149)))

(declare-fun array_inv!22726 (array!61075) Bool)

(assert (=> start!83720 (array_inv!22726 _keys!1544)))

(declare-fun b!977592 () Bool)

(declare-fun e!551151 () Bool)

(assert (=> b!977592 (= e!551149 (and e!551151 mapRes!35813))))

(declare-fun condMapEmpty!35813 () Bool)

(declare-fun mapDefault!35813 () ValueCell!10780)

