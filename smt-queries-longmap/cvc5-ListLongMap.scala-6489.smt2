; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82774 () Bool)

(assert start!82774)

(declare-fun b_free!18907 () Bool)

(declare-fun b_next!18907 () Bool)

(assert (=> start!82774 (= b_free!18907 (not b_next!18907))))

(declare-fun tp!65841 () Bool)

(declare-fun b_and!30395 () Bool)

(assert (=> start!82774 (= tp!65841 b_and!30395)))

(declare-fun b!965489 () Bool)

(declare-fun res!646276 () Bool)

(declare-fun e!544267 () Bool)

(assert (=> b!965489 (=> (not res!646276) (not e!544267))))

(declare-datatypes ((array!59503 0))(
  ( (array!59504 (arr!28620 (Array (_ BitVec 32) (_ BitVec 64))) (size!29099 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59503)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59503 (_ BitVec 32)) Bool)

(assert (=> b!965489 (= res!646276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965490 () Bool)

(declare-fun res!646274 () Bool)

(assert (=> b!965490 (=> (not res!646274) (not e!544267))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965490 (= res!646274 (validKeyInArray!0 (select (arr!28620 _keys!1686) i!803)))))

(declare-fun b!965491 () Bool)

(assert (=> b!965491 (= e!544267 false)))

(declare-fun lt!431245 () Bool)

(declare-datatypes ((V!33929 0))(
  ( (V!33930 (val!10905 Int)) )
))
(declare-datatypes ((ValueCell!10373 0))(
  ( (ValueCellFull!10373 (v!13463 V!33929)) (EmptyCell!10373) )
))
(declare-datatypes ((array!59505 0))(
  ( (array!59506 (arr!28621 (Array (_ BitVec 32) ValueCell!10373)) (size!29100 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59505)

(declare-fun minValue!1342 () V!33929)

(declare-fun defaultEntry!1403 () Int)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33929)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14026 0))(
  ( (tuple2!14027 (_1!7024 (_ BitVec 64)) (_2!7024 V!33929)) )
))
(declare-datatypes ((List!19868 0))(
  ( (Nil!19865) (Cons!19864 (h!21026 tuple2!14026) (t!28231 List!19868)) )
))
(declare-datatypes ((ListLongMap!12723 0))(
  ( (ListLongMap!12724 (toList!6377 List!19868)) )
))
(declare-fun contains!5480 (ListLongMap!12723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3610 (array!59503 array!59505 (_ BitVec 32) (_ BitVec 32) V!33929 V!33929 (_ BitVec 32) Int) ListLongMap!12723)

(assert (=> b!965491 (= lt!431245 (contains!5480 (getCurrentListMap!3610 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28620 _keys!1686) i!803)))))

(declare-fun b!965492 () Bool)

(declare-fun e!544270 () Bool)

(declare-fun tp_is_empty!21709 () Bool)

(assert (=> b!965492 (= e!544270 tp_is_empty!21709)))

(declare-fun b!965493 () Bool)

(declare-fun res!646272 () Bool)

(assert (=> b!965493 (=> (not res!646272) (not e!544267))))

(declare-datatypes ((List!19869 0))(
  ( (Nil!19866) (Cons!19865 (h!21027 (_ BitVec 64)) (t!28232 List!19869)) )
))
(declare-fun arrayNoDuplicates!0 (array!59503 (_ BitVec 32) List!19869) Bool)

(assert (=> b!965493 (= res!646272 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19866))))

(declare-fun b!965494 () Bool)

(declare-fun e!544271 () Bool)

(assert (=> b!965494 (= e!544271 tp_is_empty!21709)))

(declare-fun mapIsEmpty!34558 () Bool)

(declare-fun mapRes!34558 () Bool)

(assert (=> mapIsEmpty!34558 mapRes!34558))

(declare-fun b!965496 () Bool)

(declare-fun res!646275 () Bool)

(assert (=> b!965496 (=> (not res!646275) (not e!544267))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965496 (= res!646275 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29099 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29099 _keys!1686))))))

(declare-fun b!965497 () Bool)

(declare-fun res!646273 () Bool)

(assert (=> b!965497 (=> (not res!646273) (not e!544267))))

(assert (=> b!965497 (= res!646273 (and (= (size!29100 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29099 _keys!1686) (size!29100 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34558 () Bool)

(declare-fun tp!65840 () Bool)

(assert (=> mapNonEmpty!34558 (= mapRes!34558 (and tp!65840 e!544271))))

(declare-fun mapKey!34558 () (_ BitVec 32))

(declare-fun mapValue!34558 () ValueCell!10373)

(declare-fun mapRest!34558 () (Array (_ BitVec 32) ValueCell!10373))

(assert (=> mapNonEmpty!34558 (= (arr!28621 _values!1400) (store mapRest!34558 mapKey!34558 mapValue!34558))))

(declare-fun res!646271 () Bool)

(assert (=> start!82774 (=> (not res!646271) (not e!544267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82774 (= res!646271 (validMask!0 mask!2110))))

(assert (=> start!82774 e!544267))

(assert (=> start!82774 true))

(declare-fun e!544269 () Bool)

(declare-fun array_inv!22165 (array!59505) Bool)

(assert (=> start!82774 (and (array_inv!22165 _values!1400) e!544269)))

(declare-fun array_inv!22166 (array!59503) Bool)

(assert (=> start!82774 (array_inv!22166 _keys!1686)))

(assert (=> start!82774 tp!65841))

(assert (=> start!82774 tp_is_empty!21709))

(declare-fun b!965495 () Bool)

(assert (=> b!965495 (= e!544269 (and e!544270 mapRes!34558))))

(declare-fun condMapEmpty!34558 () Bool)

(declare-fun mapDefault!34558 () ValueCell!10373)

