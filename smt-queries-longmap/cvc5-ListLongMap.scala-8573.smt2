; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104646 () Bool)

(assert start!104646)

(declare-fun res!832527 () Bool)

(declare-fun e!707932 () Bool)

(assert (=> start!104646 (=> (not res!832527) (not e!707932))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104646 (= res!832527 (validMask!0 mask!1466))))

(assert (=> start!104646 e!707932))

(assert (=> start!104646 true))

(declare-datatypes ((array!80442 0))(
  ( (array!80443 (arr!38790 (Array (_ BitVec 32) (_ BitVec 64))) (size!39326 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80442)

(declare-fun array_inv!29615 (array!80442) Bool)

(assert (=> start!104646 (array_inv!29615 _keys!1118)))

(declare-datatypes ((V!47199 0))(
  ( (V!47200 (val!15750 Int)) )
))
(declare-datatypes ((ValueCell!14924 0))(
  ( (ValueCellFull!14924 (v!18446 V!47199)) (EmptyCell!14924) )
))
(declare-datatypes ((array!80444 0))(
  ( (array!80445 (arr!38791 (Array (_ BitVec 32) ValueCell!14924)) (size!39327 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80444)

(declare-fun e!707930 () Bool)

(declare-fun array_inv!29616 (array!80444) Bool)

(assert (=> start!104646 (and (array_inv!29616 _values!914) e!707930)))

(declare-fun b!1247755 () Bool)

(assert (=> b!1247755 (= e!707932 false)))

(declare-fun lt!563314 () Bool)

(declare-datatypes ((List!27537 0))(
  ( (Nil!27534) (Cons!27533 (h!28742 (_ BitVec 64)) (t!41006 List!27537)) )
))
(declare-fun arrayNoDuplicates!0 (array!80442 (_ BitVec 32) List!27537) Bool)

(assert (=> b!1247755 (= lt!563314 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27534))))

(declare-fun mapIsEmpty!48817 () Bool)

(declare-fun mapRes!48817 () Bool)

(assert (=> mapIsEmpty!48817 mapRes!48817))

(declare-fun b!1247756 () Bool)

(declare-fun res!832525 () Bool)

(assert (=> b!1247756 (=> (not res!832525) (not e!707932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80442 (_ BitVec 32)) Bool)

(assert (=> b!1247756 (= res!832525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247757 () Bool)

(declare-fun e!707931 () Bool)

(assert (=> b!1247757 (= e!707930 (and e!707931 mapRes!48817))))

(declare-fun condMapEmpty!48817 () Bool)

(declare-fun mapDefault!48817 () ValueCell!14924)

