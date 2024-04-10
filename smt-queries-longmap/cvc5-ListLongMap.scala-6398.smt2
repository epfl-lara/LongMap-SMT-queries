; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82184 () Bool)

(assert start!82184)

(declare-fun b_free!18457 () Bool)

(declare-fun b_next!18457 () Bool)

(assert (=> start!82184 (= b_free!18457 (not b_next!18457))))

(declare-fun tp!64331 () Bool)

(declare-fun b_and!29945 () Bool)

(assert (=> start!82184 (= tp!64331 b_and!29945)))

(declare-fun b!957848 () Bool)

(declare-fun res!641151 () Bool)

(declare-fun e!540000 () Bool)

(assert (=> b!957848 (=> (not res!641151) (not e!540000))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58429 0))(
  ( (array!58430 (arr!28088 (Array (_ BitVec 32) (_ BitVec 64))) (size!28567 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58429)

(declare-datatypes ((V!33201 0))(
  ( (V!33202 (val!10632 Int)) )
))
(declare-datatypes ((ValueCell!10100 0))(
  ( (ValueCellFull!10100 (v!13189 V!33201)) (EmptyCell!10100) )
))
(declare-datatypes ((array!58431 0))(
  ( (array!58432 (arr!28089 (Array (_ BitVec 32) ValueCell!10100)) (size!28568 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58431)

(assert (=> b!957848 (= res!641151 (and (= (size!28568 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28567 _keys!1668) (size!28568 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!641155 () Bool)

(assert (=> start!82184 (=> (not res!641155) (not e!540000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82184 (= res!641155 (validMask!0 mask!2088))))

(assert (=> start!82184 e!540000))

(assert (=> start!82184 true))

(declare-fun tp_is_empty!21163 () Bool)

(assert (=> start!82184 tp_is_empty!21163))

(declare-fun array_inv!21785 (array!58429) Bool)

(assert (=> start!82184 (array_inv!21785 _keys!1668)))

(declare-fun e!539998 () Bool)

(declare-fun array_inv!21786 (array!58431) Bool)

(assert (=> start!82184 (and (array_inv!21786 _values!1386) e!539998)))

(assert (=> start!82184 tp!64331))

(declare-fun b!957849 () Bool)

(declare-fun e!539997 () Bool)

(assert (=> b!957849 (= e!539997 tp_is_empty!21163)))

(declare-fun b!957850 () Bool)

(declare-fun e!539999 () Bool)

(assert (=> b!957850 (= e!539999 tp_is_empty!21163)))

(declare-fun mapNonEmpty!33724 () Bool)

(declare-fun mapRes!33724 () Bool)

(declare-fun tp!64332 () Bool)

(assert (=> mapNonEmpty!33724 (= mapRes!33724 (and tp!64332 e!539997))))

(declare-fun mapRest!33724 () (Array (_ BitVec 32) ValueCell!10100))

(declare-fun mapValue!33724 () ValueCell!10100)

(declare-fun mapKey!33724 () (_ BitVec 32))

(assert (=> mapNonEmpty!33724 (= (arr!28089 _values!1386) (store mapRest!33724 mapKey!33724 mapValue!33724))))

(declare-fun b!957851 () Bool)

(assert (=> b!957851 (= e!540000 false)))

(declare-fun lt!430377 () Bool)

(declare-fun minValue!1328 () V!33201)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33201)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13704 0))(
  ( (tuple2!13705 (_1!6863 (_ BitVec 64)) (_2!6863 V!33201)) )
))
(declare-datatypes ((List!19526 0))(
  ( (Nil!19523) (Cons!19522 (h!20684 tuple2!13704) (t!27889 List!19526)) )
))
(declare-datatypes ((ListLongMap!12401 0))(
  ( (ListLongMap!12402 (toList!6216 List!19526)) )
))
(declare-fun contains!5317 (ListLongMap!12401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3449 (array!58429 array!58431 (_ BitVec 32) (_ BitVec 32) V!33201 V!33201 (_ BitVec 32) Int) ListLongMap!12401)

(assert (=> b!957851 (= lt!430377 (contains!5317 (getCurrentListMap!3449 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28088 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33724 () Bool)

(assert (=> mapIsEmpty!33724 mapRes!33724))

(declare-fun b!957852 () Bool)

(declare-fun res!641152 () Bool)

(assert (=> b!957852 (=> (not res!641152) (not e!540000))))

(assert (=> b!957852 (= res!641152 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28567 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28567 _keys!1668))))))

(declare-fun b!957853 () Bool)

(declare-fun res!641153 () Bool)

(assert (=> b!957853 (=> (not res!641153) (not e!540000))))

(declare-datatypes ((List!19527 0))(
  ( (Nil!19524) (Cons!19523 (h!20685 (_ BitVec 64)) (t!27890 List!19527)) )
))
(declare-fun arrayNoDuplicates!0 (array!58429 (_ BitVec 32) List!19527) Bool)

(assert (=> b!957853 (= res!641153 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19524))))

(declare-fun b!957854 () Bool)

(assert (=> b!957854 (= e!539998 (and e!539999 mapRes!33724))))

(declare-fun condMapEmpty!33724 () Bool)

(declare-fun mapDefault!33724 () ValueCell!10100)

