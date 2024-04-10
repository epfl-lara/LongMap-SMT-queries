; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108468 () Bool)

(assert start!108468)

(declare-fun b_free!28015 () Bool)

(declare-fun b_next!28015 () Bool)

(assert (=> start!108468 (= b_free!28015 (not b_next!28015))))

(declare-fun tp!99154 () Bool)

(declare-fun b_and!46075 () Bool)

(assert (=> start!108468 (= tp!99154 b_and!46075)))

(declare-fun b!1280193 () Bool)

(declare-fun res!850384 () Bool)

(declare-fun e!731479 () Bool)

(assert (=> b!1280193 (=> (not res!850384) (not e!731479))))

(declare-datatypes ((array!84390 0))(
  ( (array!84391 (arr!40699 (Array (_ BitVec 32) (_ BitVec 64))) (size!41249 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84390)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84390 (_ BitVec 32)) Bool)

(assert (=> b!1280193 (= res!850384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52034 () Bool)

(declare-fun mapRes!52034 () Bool)

(declare-fun tp!99155 () Bool)

(declare-fun e!731480 () Bool)

(assert (=> mapNonEmpty!52034 (= mapRes!52034 (and tp!99155 e!731480))))

(declare-fun mapKey!52034 () (_ BitVec 32))

(declare-datatypes ((V!49977 0))(
  ( (V!49978 (val!16902 Int)) )
))
(declare-datatypes ((ValueCell!15929 0))(
  ( (ValueCellFull!15929 (v!19502 V!49977)) (EmptyCell!15929) )
))
(declare-fun mapRest!52034 () (Array (_ BitVec 32) ValueCell!15929))

(declare-datatypes ((array!84392 0))(
  ( (array!84393 (arr!40700 (Array (_ BitVec 32) ValueCell!15929)) (size!41250 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84392)

(declare-fun mapValue!52034 () ValueCell!15929)

(assert (=> mapNonEmpty!52034 (= (arr!40700 _values!1445) (store mapRest!52034 mapKey!52034 mapValue!52034))))

(declare-fun b!1280194 () Bool)

(declare-fun res!850382 () Bool)

(assert (=> b!1280194 (=> (not res!850382) (not e!731479))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280194 (= res!850382 (and (= (size!41250 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41249 _keys!1741) (size!41250 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280195 () Bool)

(declare-fun tp_is_empty!33655 () Bool)

(assert (=> b!1280195 (= e!731480 tp_is_empty!33655)))

(declare-fun b!1280196 () Bool)

(declare-fun res!850381 () Bool)

(assert (=> b!1280196 (=> (not res!850381) (not e!731479))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280196 (= res!850381 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41249 _keys!1741))))))

(declare-fun b!1280197 () Bool)

(declare-fun res!850383 () Bool)

(assert (=> b!1280197 (=> (not res!850383) (not e!731479))))

(declare-datatypes ((List!28831 0))(
  ( (Nil!28828) (Cons!28827 (h!30036 (_ BitVec 64)) (t!42371 List!28831)) )
))
(declare-fun arrayNoDuplicates!0 (array!84390 (_ BitVec 32) List!28831) Bool)

(assert (=> b!1280197 (= res!850383 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28828))))

(declare-fun b!1280198 () Bool)

(declare-fun e!731478 () Bool)

(declare-fun e!731476 () Bool)

(assert (=> b!1280198 (= e!731478 (and e!731476 mapRes!52034))))

(declare-fun condMapEmpty!52034 () Bool)

(declare-fun mapDefault!52034 () ValueCell!15929)

