; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108466 () Bool)

(assert start!108466)

(declare-fun b_free!28013 () Bool)

(declare-fun b_next!28013 () Bool)

(assert (=> start!108466 (= b_free!28013 (not b_next!28013))))

(declare-fun tp!99148 () Bool)

(declare-fun b_and!46073 () Bool)

(assert (=> start!108466 (= tp!99148 b_and!46073)))

(declare-fun b!1280169 () Bool)

(declare-fun e!731462 () Bool)

(declare-fun tp_is_empty!33653 () Bool)

(assert (=> b!1280169 (= e!731462 tp_is_empty!33653)))

(declare-fun b!1280170 () Bool)

(declare-fun e!731463 () Bool)

(assert (=> b!1280170 (= e!731463 tp_is_empty!33653)))

(declare-fun b!1280171 () Bool)

(declare-fun res!850369 () Bool)

(declare-fun e!731464 () Bool)

(assert (=> b!1280171 (=> (not res!850369) (not e!731464))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84386 0))(
  ( (array!84387 (arr!40697 (Array (_ BitVec 32) (_ BitVec 64))) (size!41247 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84386)

(assert (=> b!1280171 (= res!850369 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41247 _keys!1741))))))

(declare-fun b!1280173 () Bool)

(assert (=> b!1280173 (= e!731464 false)))

(declare-datatypes ((V!49973 0))(
  ( (V!49974 (val!16901 Int)) )
))
(declare-fun minValue!1387 () V!49973)

(declare-datatypes ((ValueCell!15928 0))(
  ( (ValueCellFull!15928 (v!19501 V!49973)) (EmptyCell!15928) )
))
(declare-datatypes ((array!84388 0))(
  ( (array!84389 (arr!40698 (Array (_ BitVec 32) ValueCell!15928)) (size!41248 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84388)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!49973)

(declare-fun lt!576092 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21630 0))(
  ( (tuple2!21631 (_1!10826 (_ BitVec 64)) (_2!10826 V!49973)) )
))
(declare-datatypes ((List!28829 0))(
  ( (Nil!28826) (Cons!28825 (h!30034 tuple2!21630) (t!42369 List!28829)) )
))
(declare-datatypes ((ListLongMap!19287 0))(
  ( (ListLongMap!19288 (toList!9659 List!28829)) )
))
(declare-fun contains!7774 (ListLongMap!19287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4743 (array!84386 array!84388 (_ BitVec 32) (_ BitVec 32) V!49973 V!49973 (_ BitVec 32) Int) ListLongMap!19287)

(assert (=> b!1280173 (= lt!576092 (contains!7774 (getCurrentListMap!4743 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280174 () Bool)

(declare-fun res!850368 () Bool)

(assert (=> b!1280174 (=> (not res!850368) (not e!731464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84386 (_ BitVec 32)) Bool)

(assert (=> b!1280174 (= res!850368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52031 () Bool)

(declare-fun mapRes!52031 () Bool)

(assert (=> mapIsEmpty!52031 mapRes!52031))

(declare-fun mapNonEmpty!52031 () Bool)

(declare-fun tp!99149 () Bool)

(assert (=> mapNonEmpty!52031 (= mapRes!52031 (and tp!99149 e!731463))))

(declare-fun mapRest!52031 () (Array (_ BitVec 32) ValueCell!15928))

(declare-fun mapKey!52031 () (_ BitVec 32))

(declare-fun mapValue!52031 () ValueCell!15928)

(assert (=> mapNonEmpty!52031 (= (arr!40698 _values!1445) (store mapRest!52031 mapKey!52031 mapValue!52031))))

(declare-fun res!850370 () Bool)

(assert (=> start!108466 (=> (not res!850370) (not e!731464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108466 (= res!850370 (validMask!0 mask!2175))))

(assert (=> start!108466 e!731464))

(assert (=> start!108466 tp_is_empty!33653))

(assert (=> start!108466 true))

(declare-fun e!731465 () Bool)

(declare-fun array_inv!30891 (array!84388) Bool)

(assert (=> start!108466 (and (array_inv!30891 _values!1445) e!731465)))

(declare-fun array_inv!30892 (array!84386) Bool)

(assert (=> start!108466 (array_inv!30892 _keys!1741)))

(assert (=> start!108466 tp!99148))

(declare-fun b!1280172 () Bool)

(declare-fun res!850367 () Bool)

(assert (=> b!1280172 (=> (not res!850367) (not e!731464))))

(declare-datatypes ((List!28830 0))(
  ( (Nil!28827) (Cons!28826 (h!30035 (_ BitVec 64)) (t!42370 List!28830)) )
))
(declare-fun arrayNoDuplicates!0 (array!84386 (_ BitVec 32) List!28830) Bool)

(assert (=> b!1280172 (= res!850367 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28827))))

(declare-fun b!1280175 () Bool)

(assert (=> b!1280175 (= e!731465 (and e!731462 mapRes!52031))))

(declare-fun condMapEmpty!52031 () Bool)

(declare-fun mapDefault!52031 () ValueCell!15928)

