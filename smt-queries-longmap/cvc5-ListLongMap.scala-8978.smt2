; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108628 () Bool)

(assert start!108628)

(declare-fun b_free!28141 () Bool)

(declare-fun b_next!28141 () Bool)

(assert (=> start!108628 (= b_free!28141 (not b_next!28141))))

(declare-fun tp!99539 () Bool)

(declare-fun b_and!46207 () Bool)

(assert (=> start!108628 (= tp!99539 b_and!46207)))

(declare-fun b!1282229 () Bool)

(declare-fun e!732619 () Bool)

(declare-fun tp_is_empty!33781 () Bool)

(assert (=> b!1282229 (= e!732619 tp_is_empty!33781)))

(declare-fun b!1282230 () Bool)

(declare-fun res!851703 () Bool)

(declare-fun e!732617 () Bool)

(assert (=> b!1282230 (=> (not res!851703) (not e!732617))))

(declare-datatypes ((array!84632 0))(
  ( (array!84633 (arr!40818 (Array (_ BitVec 32) (_ BitVec 64))) (size!41368 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84632)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84632 (_ BitVec 32)) Bool)

(assert (=> b!1282230 (= res!851703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282231 () Bool)

(assert (=> b!1282231 (= e!732617 false)))

(declare-datatypes ((V!50145 0))(
  ( (V!50146 (val!16965 Int)) )
))
(declare-fun minValue!1387 () V!50145)

(declare-fun zeroValue!1387 () V!50145)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576508 () Bool)

(declare-datatypes ((ValueCell!15992 0))(
  ( (ValueCellFull!15992 (v!19567 V!50145)) (EmptyCell!15992) )
))
(declare-datatypes ((array!84634 0))(
  ( (array!84635 (arr!40819 (Array (_ BitVec 32) ValueCell!15992)) (size!41369 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84634)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21722 0))(
  ( (tuple2!21723 (_1!10872 (_ BitVec 64)) (_2!10872 V!50145)) )
))
(declare-datatypes ((List!28916 0))(
  ( (Nil!28913) (Cons!28912 (h!30121 tuple2!21722) (t!42460 List!28916)) )
))
(declare-datatypes ((ListLongMap!19379 0))(
  ( (ListLongMap!19380 (toList!9705 List!28916)) )
))
(declare-fun contains!7822 (ListLongMap!19379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4789 (array!84632 array!84634 (_ BitVec 32) (_ BitVec 32) V!50145 V!50145 (_ BitVec 32) Int) ListLongMap!19379)

(assert (=> b!1282231 (= lt!576508 (contains!7822 (getCurrentListMap!4789 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1282232 () Bool)

(declare-fun res!851704 () Bool)

(assert (=> b!1282232 (=> (not res!851704) (not e!732617))))

(declare-datatypes ((List!28917 0))(
  ( (Nil!28914) (Cons!28913 (h!30122 (_ BitVec 64)) (t!42461 List!28917)) )
))
(declare-fun arrayNoDuplicates!0 (array!84632 (_ BitVec 32) List!28917) Bool)

(assert (=> b!1282232 (= res!851704 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28914))))

(declare-fun mapNonEmpty!52229 () Bool)

(declare-fun mapRes!52229 () Bool)

(declare-fun tp!99538 () Bool)

(declare-fun e!732618 () Bool)

(assert (=> mapNonEmpty!52229 (= mapRes!52229 (and tp!99538 e!732618))))

(declare-fun mapValue!52229 () ValueCell!15992)

(declare-fun mapKey!52229 () (_ BitVec 32))

(declare-fun mapRest!52229 () (Array (_ BitVec 32) ValueCell!15992))

(assert (=> mapNonEmpty!52229 (= (arr!40819 _values!1445) (store mapRest!52229 mapKey!52229 mapValue!52229))))

(declare-fun b!1282233 () Bool)

(declare-fun e!732620 () Bool)

(assert (=> b!1282233 (= e!732620 (and e!732619 mapRes!52229))))

(declare-fun condMapEmpty!52229 () Bool)

(declare-fun mapDefault!52229 () ValueCell!15992)

