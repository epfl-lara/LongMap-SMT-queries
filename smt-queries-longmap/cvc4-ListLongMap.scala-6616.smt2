; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83634 () Bool)

(assert start!83634)

(declare-fun b!977022 () Bool)

(declare-fun res!653959 () Bool)

(declare-fun e!550698 () Bool)

(assert (=> b!977022 (=> (not res!653959) (not e!550698))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!34949 0))(
  ( (V!34950 (val!11288 Int)) )
))
(declare-datatypes ((ValueCell!10756 0))(
  ( (ValueCellFull!10756 (v!13849 V!34949)) (EmptyCell!10756) )
))
(declare-datatypes ((array!60977 0))(
  ( (array!60978 (arr!29350 (Array (_ BitVec 32) ValueCell!10756)) (size!29829 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60977)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!60979 0))(
  ( (array!60980 (arr!29351 (Array (_ BitVec 32) (_ BitVec 64))) (size!29830 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60979)

(assert (=> b!977022 (= res!653959 (and (= (size!29829 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29830 _keys!1544) (size!29829 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977023 () Bool)

(declare-fun e!550702 () Bool)

(declare-fun tp_is_empty!22475 () Bool)

(assert (=> b!977023 (= e!550702 tp_is_empty!22475)))

(declare-fun b!977024 () Bool)

(declare-fun res!653961 () Bool)

(assert (=> b!977024 (=> (not res!653961) (not e!550698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60979 (_ BitVec 32)) Bool)

(assert (=> b!977024 (= res!653961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977025 () Bool)

(declare-fun e!550699 () Bool)

(declare-fun mapRes!35729 () Bool)

(assert (=> b!977025 (= e!550699 (and e!550702 mapRes!35729))))

(declare-fun condMapEmpty!35729 () Bool)

(declare-fun mapDefault!35729 () ValueCell!10756)

