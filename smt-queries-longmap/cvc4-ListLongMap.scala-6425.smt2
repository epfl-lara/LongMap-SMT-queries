; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82350 () Bool)

(assert start!82350)

(declare-fun b_free!18617 () Bool)

(declare-fun b_next!18617 () Bool)

(assert (=> start!82350 (= b_free!18617 (not b_next!18617))))

(declare-fun tp!64821 () Bool)

(declare-fun b_and!30105 () Bool)

(assert (=> start!82350 (= tp!64821 b_and!30105)))

(declare-fun b!960152 () Bool)

(declare-fun res!642711 () Bool)

(declare-fun e!541241 () Bool)

(assert (=> b!960152 (=> (not res!642711) (not e!541241))))

(declare-datatypes ((array!58749 0))(
  ( (array!58750 (arr!28248 (Array (_ BitVec 32) (_ BitVec 64))) (size!28727 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58749)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960152 (= res!642711 (validKeyInArray!0 (select (arr!28248 _keys!1668) i!793)))))

(declare-fun res!642710 () Bool)

(assert (=> start!82350 (=> (not res!642710) (not e!541241))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82350 (= res!642710 (validMask!0 mask!2088))))

(assert (=> start!82350 e!541241))

(assert (=> start!82350 true))

(declare-fun tp_is_empty!21329 () Bool)

(assert (=> start!82350 tp_is_empty!21329))

(declare-fun array_inv!21889 (array!58749) Bool)

(assert (=> start!82350 (array_inv!21889 _keys!1668)))

(declare-datatypes ((V!33421 0))(
  ( (V!33422 (val!10715 Int)) )
))
(declare-datatypes ((ValueCell!10183 0))(
  ( (ValueCellFull!10183 (v!13272 V!33421)) (EmptyCell!10183) )
))
(declare-datatypes ((array!58751 0))(
  ( (array!58752 (arr!28249 (Array (_ BitVec 32) ValueCell!10183)) (size!28728 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58751)

(declare-fun e!541243 () Bool)

(declare-fun array_inv!21890 (array!58751) Bool)

(assert (=> start!82350 (and (array_inv!21890 _values!1386) e!541243)))

(assert (=> start!82350 tp!64821))

(declare-fun b!960153 () Bool)

(declare-fun res!642708 () Bool)

(assert (=> b!960153 (=> (not res!642708) (not e!541241))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960153 (= res!642708 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28727 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28727 _keys!1668))))))

(declare-fun b!960154 () Bool)

(declare-fun res!642713 () Bool)

(assert (=> b!960154 (=> (not res!642713) (not e!541241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58749 (_ BitVec 32)) Bool)

(assert (=> b!960154 (= res!642713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33973 () Bool)

(declare-fun mapRes!33973 () Bool)

(assert (=> mapIsEmpty!33973 mapRes!33973))

(declare-fun mapNonEmpty!33973 () Bool)

(declare-fun tp!64820 () Bool)

(declare-fun e!541244 () Bool)

(assert (=> mapNonEmpty!33973 (= mapRes!33973 (and tp!64820 e!541244))))

(declare-fun mapValue!33973 () ValueCell!10183)

(declare-fun mapRest!33973 () (Array (_ BitVec 32) ValueCell!10183))

(declare-fun mapKey!33973 () (_ BitVec 32))

(assert (=> mapNonEmpty!33973 (= (arr!28249 _values!1386) (store mapRest!33973 mapKey!33973 mapValue!33973))))

(declare-fun b!960155 () Bool)

(declare-fun res!642709 () Bool)

(assert (=> b!960155 (=> (not res!642709) (not e!541241))))

(declare-datatypes ((List!19642 0))(
  ( (Nil!19639) (Cons!19638 (h!20800 (_ BitVec 64)) (t!28005 List!19642)) )
))
(declare-fun arrayNoDuplicates!0 (array!58749 (_ BitVec 32) List!19642) Bool)

(assert (=> b!960155 (= res!642709 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19639))))

(declare-fun b!960156 () Bool)

(declare-fun e!541242 () Bool)

(assert (=> b!960156 (= e!541242 tp_is_empty!21329)))

(declare-fun b!960157 () Bool)

(assert (=> b!960157 (= e!541241 false)))

(declare-fun minValue!1328 () V!33421)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430617 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33421)

(declare-datatypes ((tuple2!13822 0))(
  ( (tuple2!13823 (_1!6922 (_ BitVec 64)) (_2!6922 V!33421)) )
))
(declare-datatypes ((List!19643 0))(
  ( (Nil!19640) (Cons!19639 (h!20801 tuple2!13822) (t!28006 List!19643)) )
))
(declare-datatypes ((ListLongMap!12519 0))(
  ( (ListLongMap!12520 (toList!6275 List!19643)) )
))
(declare-fun contains!5374 (ListLongMap!12519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3508 (array!58749 array!58751 (_ BitVec 32) (_ BitVec 32) V!33421 V!33421 (_ BitVec 32) Int) ListLongMap!12519)

(assert (=> b!960157 (= lt!430617 (contains!5374 (getCurrentListMap!3508 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28248 _keys!1668) i!793)))))

(declare-fun b!960158 () Bool)

(assert (=> b!960158 (= e!541243 (and e!541242 mapRes!33973))))

(declare-fun condMapEmpty!33973 () Bool)

(declare-fun mapDefault!33973 () ValueCell!10183)

