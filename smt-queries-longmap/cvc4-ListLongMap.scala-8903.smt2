; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108072 () Bool)

(assert start!108072)

(declare-fun b_free!27785 () Bool)

(declare-fun b_next!27785 () Bool)

(assert (=> start!108072 (= b_free!27785 (not b_next!27785))))

(declare-fun tp!98308 () Bool)

(declare-fun b_and!45841 () Bool)

(assert (=> start!108072 (= tp!98308 b_and!45841)))

(declare-fun b!1276313 () Bool)

(declare-fun e!728792 () Bool)

(declare-fun e!728794 () Bool)

(declare-fun mapRes!51533 () Bool)

(assert (=> b!1276313 (= e!728792 (and e!728794 mapRes!51533))))

(declare-fun condMapEmpty!51533 () Bool)

(declare-datatypes ((V!49549 0))(
  ( (V!49550 (val!16742 Int)) )
))
(declare-datatypes ((ValueCell!15769 0))(
  ( (ValueCellFull!15769 (v!19339 V!49549)) (EmptyCell!15769) )
))
(declare-datatypes ((array!83766 0))(
  ( (array!83767 (arr!40394 (Array (_ BitVec 32) ValueCell!15769)) (size!40944 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83766)

(declare-fun mapDefault!51533 () ValueCell!15769)

