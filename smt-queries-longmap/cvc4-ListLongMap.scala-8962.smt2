; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108502 () Bool)

(assert start!108502)

(declare-fun b_free!28049 () Bool)

(declare-fun b_next!28049 () Bool)

(assert (=> start!108502 (= b_free!28049 (not b_next!28049))))

(declare-fun tp!99256 () Bool)

(declare-fun b_and!46109 () Bool)

(assert (=> start!108502 (= tp!99256 b_and!46109)))

(declare-fun b!1280635 () Bool)

(declare-fun e!731733 () Bool)

(declare-fun tp_is_empty!33689 () Bool)

(assert (=> b!1280635 (= e!731733 tp_is_empty!33689)))

(declare-fun b!1280636 () Bool)

(declare-fun res!850675 () Bool)

(declare-fun e!731735 () Bool)

(assert (=> b!1280636 (=> (not res!850675) (not e!731735))))

(declare-datatypes ((array!84454 0))(
  ( (array!84455 (arr!40731 (Array (_ BitVec 32) (_ BitVec 64))) (size!41281 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84454)

(declare-datatypes ((List!28853 0))(
  ( (Nil!28850) (Cons!28849 (h!30058 (_ BitVec 64)) (t!42393 List!28853)) )
))
(declare-fun arrayNoDuplicates!0 (array!84454 (_ BitVec 32) List!28853) Bool)

(assert (=> b!1280636 (= res!850675 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28850))))

(declare-fun mapIsEmpty!52085 () Bool)

(declare-fun mapRes!52085 () Bool)

(assert (=> mapIsEmpty!52085 mapRes!52085))

(declare-fun res!850671 () Bool)

(assert (=> start!108502 (=> (not res!850671) (not e!731735))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108502 (= res!850671 (validMask!0 mask!2175))))

(assert (=> start!108502 e!731735))

(assert (=> start!108502 tp_is_empty!33689))

(assert (=> start!108502 true))

(declare-datatypes ((V!50021 0))(
  ( (V!50022 (val!16919 Int)) )
))
(declare-datatypes ((ValueCell!15946 0))(
  ( (ValueCellFull!15946 (v!19519 V!50021)) (EmptyCell!15946) )
))
(declare-datatypes ((array!84456 0))(
  ( (array!84457 (arr!40732 (Array (_ BitVec 32) ValueCell!15946)) (size!41282 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84456)

(declare-fun e!731734 () Bool)

(declare-fun array_inv!30911 (array!84456) Bool)

(assert (=> start!108502 (and (array_inv!30911 _values!1445) e!731734)))

(declare-fun array_inv!30912 (array!84454) Bool)

(assert (=> start!108502 (array_inv!30912 _keys!1741)))

(assert (=> start!108502 tp!99256))

(declare-fun b!1280637 () Bool)

(assert (=> b!1280637 (= e!731735 (not true))))

(declare-fun minValue!1387 () V!50021)

(declare-fun zeroValue!1387 () V!50021)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21656 0))(
  ( (tuple2!21657 (_1!10839 (_ BitVec 64)) (_2!10839 V!50021)) )
))
(declare-datatypes ((List!28854 0))(
  ( (Nil!28851) (Cons!28850 (h!30059 tuple2!21656) (t!42394 List!28854)) )
))
(declare-datatypes ((ListLongMap!19313 0))(
  ( (ListLongMap!19314 (toList!9672 List!28854)) )
))
(declare-fun contains!7787 (ListLongMap!19313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4756 (array!84454 array!84456 (_ BitVec 32) (_ BitVec 32) V!50021 V!50021 (_ BitVec 32) Int) ListLongMap!19313)

(assert (=> b!1280637 (contains!7787 (getCurrentListMap!4756 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42401 0))(
  ( (Unit!42402) )
))
(declare-fun lt!576146 () Unit!42401)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!5 (array!84454 array!84456 (_ BitVec 32) (_ BitVec 32) V!50021 V!50021 (_ BitVec 64) (_ BitVec 32) Int) Unit!42401)

(assert (=> b!1280637 (= lt!576146 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!5 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280638 () Bool)

(declare-fun e!731731 () Bool)

(assert (=> b!1280638 (= e!731731 tp_is_empty!33689)))

(declare-fun b!1280639 () Bool)

(declare-fun res!850674 () Bool)

(assert (=> b!1280639 (=> (not res!850674) (not e!731735))))

(assert (=> b!1280639 (= res!850674 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41281 _keys!1741)) (not (= (select (arr!40731 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1280640 () Bool)

(declare-fun res!850673 () Bool)

(assert (=> b!1280640 (=> (not res!850673) (not e!731735))))

(assert (=> b!1280640 (= res!850673 (contains!7787 (getCurrentListMap!4756 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280641 () Bool)

(declare-fun res!850672 () Bool)

(assert (=> b!1280641 (=> (not res!850672) (not e!731735))))

(assert (=> b!1280641 (= res!850672 (and (= (size!41282 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41281 _keys!1741) (size!41282 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52085 () Bool)

(declare-fun tp!99257 () Bool)

(assert (=> mapNonEmpty!52085 (= mapRes!52085 (and tp!99257 e!731733))))

(declare-fun mapRest!52085 () (Array (_ BitVec 32) ValueCell!15946))

(declare-fun mapValue!52085 () ValueCell!15946)

(declare-fun mapKey!52085 () (_ BitVec 32))

(assert (=> mapNonEmpty!52085 (= (arr!40732 _values!1445) (store mapRest!52085 mapKey!52085 mapValue!52085))))

(declare-fun b!1280642 () Bool)

(declare-fun res!850670 () Bool)

(assert (=> b!1280642 (=> (not res!850670) (not e!731735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84454 (_ BitVec 32)) Bool)

(assert (=> b!1280642 (= res!850670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280643 () Bool)

(assert (=> b!1280643 (= e!731734 (and e!731731 mapRes!52085))))

(declare-fun condMapEmpty!52085 () Bool)

(declare-fun mapDefault!52085 () ValueCell!15946)

