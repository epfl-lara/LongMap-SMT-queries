; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83662 () Bool)

(assert start!83662)

(declare-fun b!977178 () Bool)

(declare-fun res!654035 () Bool)

(declare-fun e!550822 () Bool)

(assert (=> b!977178 (=> (not res!654035) (not e!550822))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!34965 0))(
  ( (V!34966 (val!11294 Int)) )
))
(declare-datatypes ((ValueCell!10762 0))(
  ( (ValueCellFull!10762 (v!13855 V!34965)) (EmptyCell!10762) )
))
(declare-datatypes ((array!61005 0))(
  ( (array!61006 (arr!29362 (Array (_ BitVec 32) ValueCell!10762)) (size!29841 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61005)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61007 0))(
  ( (array!61008 (arr!29363 (Array (_ BitVec 32) (_ BitVec 64))) (size!29842 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61007)

(assert (=> b!977178 (= res!654035 (and (= (size!29841 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29842 _keys!1544) (size!29841 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977179 () Bool)

(declare-datatypes ((List!20369 0))(
  ( (Nil!20366) (Cons!20365 (h!21527 (_ BitVec 64)) (t!28884 List!20369)) )
))
(declare-fun noDuplicate!1375 (List!20369) Bool)

(assert (=> b!977179 (= e!550822 (not (noDuplicate!1375 Nil!20366)))))

(declare-fun b!977180 () Bool)

(declare-fun e!550820 () Bool)

(declare-fun e!550819 () Bool)

(declare-fun mapRes!35753 () Bool)

(assert (=> b!977180 (= e!550820 (and e!550819 mapRes!35753))))

(declare-fun condMapEmpty!35753 () Bool)

(declare-fun mapDefault!35753 () ValueCell!10762)

