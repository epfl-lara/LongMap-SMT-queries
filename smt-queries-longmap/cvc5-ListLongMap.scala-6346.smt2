; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81800 () Bool)

(assert start!81800)

(declare-fun b!953988 () Bool)

(declare-fun res!638839 () Bool)

(declare-fun e!537457 () Bool)

(assert (=> b!953988 (=> (not res!638839) (not e!537457))))

(declare-datatypes ((array!57813 0))(
  ( (array!57814 (arr!27787 (Array (_ BitVec 32) (_ BitVec 64))) (size!28266 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57813)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57813 (_ BitVec 32)) Bool)

(assert (=> b!953988 (= res!638839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953989 () Bool)

(declare-fun e!537454 () Bool)

(assert (=> b!953989 (= e!537457 e!537454)))

(declare-fun res!638841 () Bool)

(assert (=> b!953989 (=> res!638841 e!537454)))

(declare-datatypes ((List!19379 0))(
  ( (Nil!19376) (Cons!19375 (h!20537 (_ BitVec 64)) (t!27740 List!19379)) )
))
(declare-fun contains!5261 (List!19379 (_ BitVec 64)) Bool)

(assert (=> b!953989 (= res!638841 (contains!5261 Nil!19376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953990 () Bool)

(declare-fun e!537453 () Bool)

(declare-fun tp_is_empty!20851 () Bool)

(assert (=> b!953990 (= e!537453 tp_is_empty!20851)))

(declare-fun b!953991 () Bool)

(assert (=> b!953991 (= e!537454 (contains!5261 Nil!19376 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!33235 () Bool)

(declare-fun mapRes!33235 () Bool)

(assert (=> mapIsEmpty!33235 mapRes!33235))

(declare-fun b!953992 () Bool)

(declare-fun res!638842 () Bool)

(assert (=> b!953992 (=> (not res!638842) (not e!537457))))

(assert (=> b!953992 (= res!638842 (and (bvsle #b00000000000000000000000000000000 (size!28266 _keys!1441)) (bvslt (size!28266 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun res!638837 () Bool)

(assert (=> start!81800 (=> (not res!638837) (not e!537457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81800 (= res!638837 (validMask!0 mask!1823))))

(assert (=> start!81800 e!537457))

(assert (=> start!81800 true))

(declare-datatypes ((V!32785 0))(
  ( (V!32786 (val!10476 Int)) )
))
(declare-datatypes ((ValueCell!9944 0))(
  ( (ValueCellFull!9944 (v!13030 V!32785)) (EmptyCell!9944) )
))
(declare-datatypes ((array!57815 0))(
  ( (array!57816 (arr!27788 (Array (_ BitVec 32) ValueCell!9944)) (size!28267 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57815)

(declare-fun e!537455 () Bool)

(declare-fun array_inv!21571 (array!57815) Bool)

(assert (=> start!81800 (and (array_inv!21571 _values!1197) e!537455)))

(declare-fun array_inv!21572 (array!57813) Bool)

(assert (=> start!81800 (array_inv!21572 _keys!1441)))

(declare-fun b!953993 () Bool)

(declare-fun res!638838 () Bool)

(assert (=> b!953993 (=> (not res!638838) (not e!537457))))

(declare-fun noDuplicate!1359 (List!19379) Bool)

(assert (=> b!953993 (= res!638838 (noDuplicate!1359 Nil!19376))))

(declare-fun mapNonEmpty!33235 () Bool)

(declare-fun tp!63624 () Bool)

(assert (=> mapNonEmpty!33235 (= mapRes!33235 (and tp!63624 e!537453))))

(declare-fun mapRest!33235 () (Array (_ BitVec 32) ValueCell!9944))

(declare-fun mapValue!33235 () ValueCell!9944)

(declare-fun mapKey!33235 () (_ BitVec 32))

(assert (=> mapNonEmpty!33235 (= (arr!27788 _values!1197) (store mapRest!33235 mapKey!33235 mapValue!33235))))

(declare-fun b!953994 () Bool)

(declare-fun res!638840 () Bool)

(assert (=> b!953994 (=> (not res!638840) (not e!537457))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953994 (= res!638840 (and (= (size!28267 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28266 _keys!1441) (size!28267 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!953995 () Bool)

(declare-fun e!537458 () Bool)

(assert (=> b!953995 (= e!537458 tp_is_empty!20851)))

(declare-fun b!953996 () Bool)

(assert (=> b!953996 (= e!537455 (and e!537458 mapRes!33235))))

(declare-fun condMapEmpty!33235 () Bool)

(declare-fun mapDefault!33235 () ValueCell!9944)

