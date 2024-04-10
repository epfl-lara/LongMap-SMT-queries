; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82358 () Bool)

(assert start!82358)

(declare-fun b_free!18625 () Bool)

(declare-fun b_next!18625 () Bool)

(assert (=> start!82358 (= b_free!18625 (not b_next!18625))))

(declare-fun tp!64845 () Bool)

(declare-fun b_and!30113 () Bool)

(assert (=> start!82358 (= tp!64845 b_and!30113)))

(declare-fun mapIsEmpty!33985 () Bool)

(declare-fun mapRes!33985 () Bool)

(assert (=> mapIsEmpty!33985 mapRes!33985))

(declare-fun b!960260 () Bool)

(declare-fun res!642780 () Bool)

(declare-fun e!541304 () Bool)

(assert (=> b!960260 (=> (not res!642780) (not e!541304))))

(declare-datatypes ((array!58765 0))(
  ( (array!58766 (arr!28256 (Array (_ BitVec 32) (_ BitVec 64))) (size!28735 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58765)

(declare-datatypes ((List!19650 0))(
  ( (Nil!19647) (Cons!19646 (h!20808 (_ BitVec 64)) (t!28013 List!19650)) )
))
(declare-fun arrayNoDuplicates!0 (array!58765 (_ BitVec 32) List!19650) Bool)

(assert (=> b!960260 (= res!642780 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19647))))

(declare-fun b!960261 () Bool)

(declare-fun res!642784 () Bool)

(assert (=> b!960261 (=> (not res!642784) (not e!541304))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33433 0))(
  ( (V!33434 (val!10719 Int)) )
))
(declare-datatypes ((ValueCell!10187 0))(
  ( (ValueCellFull!10187 (v!13276 V!33433)) (EmptyCell!10187) )
))
(declare-datatypes ((array!58767 0))(
  ( (array!58768 (arr!28257 (Array (_ BitVec 32) ValueCell!10187)) (size!28736 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58767)

(assert (=> b!960261 (= res!642784 (and (= (size!28736 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28735 _keys!1668) (size!28736 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960262 () Bool)

(declare-fun res!642782 () Bool)

(assert (=> b!960262 (=> (not res!642782) (not e!541304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58765 (_ BitVec 32)) Bool)

(assert (=> b!960262 (= res!642782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960263 () Bool)

(declare-fun e!541305 () Bool)

(declare-fun tp_is_empty!21337 () Bool)

(assert (=> b!960263 (= e!541305 tp_is_empty!21337)))

(declare-fun b!960264 () Bool)

(declare-fun res!642783 () Bool)

(assert (=> b!960264 (=> (not res!642783) (not e!541304))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960264 (= res!642783 (validKeyInArray!0 (select (arr!28256 _keys!1668) i!793)))))

(declare-fun b!960265 () Bool)

(assert (=> b!960265 (= e!541304 false)))

(declare-fun minValue!1328 () V!33433)

(declare-fun zeroValue!1328 () V!33433)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430629 () Bool)

(declare-datatypes ((tuple2!13830 0))(
  ( (tuple2!13831 (_1!6926 (_ BitVec 64)) (_2!6926 V!33433)) )
))
(declare-datatypes ((List!19651 0))(
  ( (Nil!19648) (Cons!19647 (h!20809 tuple2!13830) (t!28014 List!19651)) )
))
(declare-datatypes ((ListLongMap!12527 0))(
  ( (ListLongMap!12528 (toList!6279 List!19651)) )
))
(declare-fun contains!5378 (ListLongMap!12527 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3512 (array!58765 array!58767 (_ BitVec 32) (_ BitVec 32) V!33433 V!33433 (_ BitVec 32) Int) ListLongMap!12527)

(assert (=> b!960265 (= lt!430629 (contains!5378 (getCurrentListMap!3512 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28256 _keys!1668) i!793)))))

(declare-fun b!960266 () Bool)

(declare-fun res!642781 () Bool)

(assert (=> b!960266 (=> (not res!642781) (not e!541304))))

(assert (=> b!960266 (= res!642781 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28735 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28735 _keys!1668))))))

(declare-fun b!960267 () Bool)

(declare-fun e!541303 () Bool)

(declare-fun e!541301 () Bool)

(assert (=> b!960267 (= e!541303 (and e!541301 mapRes!33985))))

(declare-fun condMapEmpty!33985 () Bool)

(declare-fun mapDefault!33985 () ValueCell!10187)

