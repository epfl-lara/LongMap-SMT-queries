; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82326 () Bool)

(assert start!82326)

(declare-fun b_free!18593 () Bool)

(declare-fun b_next!18593 () Bool)

(assert (=> start!82326 (= b_free!18593 (not b_next!18593))))

(declare-fun tp!64749 () Bool)

(declare-fun b_and!30081 () Bool)

(assert (=> start!82326 (= tp!64749 b_and!30081)))

(declare-fun b!959828 () Bool)

(declare-fun res!642495 () Bool)

(declare-fun e!541063 () Bool)

(assert (=> b!959828 (=> (not res!642495) (not e!541063))))

(declare-datatypes ((array!58701 0))(
  ( (array!58702 (arr!28224 (Array (_ BitVec 32) (_ BitVec 64))) (size!28703 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58701)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959828 (= res!642495 (validKeyInArray!0 (select (arr!28224 _keys!1668) i!793)))))

(declare-fun b!959829 () Bool)

(declare-fun res!642497 () Bool)

(assert (=> b!959829 (=> (not res!642497) (not e!541063))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33389 0))(
  ( (V!33390 (val!10703 Int)) )
))
(declare-datatypes ((ValueCell!10171 0))(
  ( (ValueCellFull!10171 (v!13260 V!33389)) (EmptyCell!10171) )
))
(declare-datatypes ((array!58703 0))(
  ( (array!58704 (arr!28225 (Array (_ BitVec 32) ValueCell!10171)) (size!28704 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58703)

(assert (=> b!959829 (= res!642497 (and (= (size!28704 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28703 _keys!1668) (size!28704 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959830 () Bool)

(assert (=> b!959830 (= e!541063 false)))

(declare-fun lt!430581 () Bool)

(declare-fun minValue!1328 () V!33389)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33389)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13806 0))(
  ( (tuple2!13807 (_1!6914 (_ BitVec 64)) (_2!6914 V!33389)) )
))
(declare-datatypes ((List!19625 0))(
  ( (Nil!19622) (Cons!19621 (h!20783 tuple2!13806) (t!27988 List!19625)) )
))
(declare-datatypes ((ListLongMap!12503 0))(
  ( (ListLongMap!12504 (toList!6267 List!19625)) )
))
(declare-fun contains!5366 (ListLongMap!12503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3500 (array!58701 array!58703 (_ BitVec 32) (_ BitVec 32) V!33389 V!33389 (_ BitVec 32) Int) ListLongMap!12503)

(assert (=> b!959830 (= lt!430581 (contains!5366 (getCurrentListMap!3500 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28224 _keys!1668) i!793)))))

(declare-fun b!959832 () Bool)

(declare-fun res!642494 () Bool)

(assert (=> b!959832 (=> (not res!642494) (not e!541063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58701 (_ BitVec 32)) Bool)

(assert (=> b!959832 (= res!642494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959833 () Bool)

(declare-fun res!642496 () Bool)

(assert (=> b!959833 (=> (not res!642496) (not e!541063))))

(assert (=> b!959833 (= res!642496 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28703 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28703 _keys!1668))))))

(declare-fun mapNonEmpty!33937 () Bool)

(declare-fun mapRes!33937 () Bool)

(declare-fun tp!64748 () Bool)

(declare-fun e!541062 () Bool)

(assert (=> mapNonEmpty!33937 (= mapRes!33937 (and tp!64748 e!541062))))

(declare-fun mapValue!33937 () ValueCell!10171)

(declare-fun mapRest!33937 () (Array (_ BitVec 32) ValueCell!10171))

(declare-fun mapKey!33937 () (_ BitVec 32))

(assert (=> mapNonEmpty!33937 (= (arr!28225 _values!1386) (store mapRest!33937 mapKey!33937 mapValue!33937))))

(declare-fun b!959834 () Bool)

(declare-fun res!642493 () Bool)

(assert (=> b!959834 (=> (not res!642493) (not e!541063))))

(declare-datatypes ((List!19626 0))(
  ( (Nil!19623) (Cons!19622 (h!20784 (_ BitVec 64)) (t!27989 List!19626)) )
))
(declare-fun arrayNoDuplicates!0 (array!58701 (_ BitVec 32) List!19626) Bool)

(assert (=> b!959834 (= res!642493 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19623))))

(declare-fun b!959835 () Bool)

(declare-fun e!541064 () Bool)

(declare-fun tp_is_empty!21305 () Bool)

(assert (=> b!959835 (= e!541064 tp_is_empty!21305)))

(declare-fun b!959836 () Bool)

(assert (=> b!959836 (= e!541062 tp_is_empty!21305)))

(declare-fun mapIsEmpty!33937 () Bool)

(assert (=> mapIsEmpty!33937 mapRes!33937))

(declare-fun b!959831 () Bool)

(declare-fun e!541065 () Bool)

(assert (=> b!959831 (= e!541065 (and e!541064 mapRes!33937))))

(declare-fun condMapEmpty!33937 () Bool)

(declare-fun mapDefault!33937 () ValueCell!10171)

