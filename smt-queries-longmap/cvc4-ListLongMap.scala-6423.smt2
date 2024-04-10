; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82338 () Bool)

(assert start!82338)

(declare-fun b_free!18605 () Bool)

(declare-fun b_next!18605 () Bool)

(assert (=> start!82338 (= b_free!18605 (not b_next!18605))))

(declare-fun tp!64785 () Bool)

(declare-fun b_and!30093 () Bool)

(assert (=> start!82338 (= tp!64785 b_and!30093)))

(declare-fun b!959990 () Bool)

(declare-fun res!642604 () Bool)

(declare-fun e!541152 () Bool)

(assert (=> b!959990 (=> (not res!642604) (not e!541152))))

(declare-datatypes ((array!58725 0))(
  ( (array!58726 (arr!28236 (Array (_ BitVec 32) (_ BitVec 64))) (size!28715 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58725)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58725 (_ BitVec 32)) Bool)

(assert (=> b!959990 (= res!642604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959991 () Bool)

(declare-fun res!642601 () Bool)

(assert (=> b!959991 (=> (not res!642601) (not e!541152))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959991 (= res!642601 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28715 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28715 _keys!1668))))))

(declare-fun b!959992 () Bool)

(declare-fun res!642600 () Bool)

(assert (=> b!959992 (=> (not res!642600) (not e!541152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959992 (= res!642600 (validKeyInArray!0 (select (arr!28236 _keys!1668) i!793)))))

(declare-fun b!959993 () Bool)

(assert (=> b!959993 (= e!541152 false)))

(declare-datatypes ((V!33405 0))(
  ( (V!33406 (val!10709 Int)) )
))
(declare-fun minValue!1328 () V!33405)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10177 0))(
  ( (ValueCellFull!10177 (v!13266 V!33405)) (EmptyCell!10177) )
))
(declare-datatypes ((array!58727 0))(
  ( (array!58728 (arr!28237 (Array (_ BitVec 32) ValueCell!10177)) (size!28716 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58727)

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430599 () Bool)

(declare-fun zeroValue!1328 () V!33405)

(declare-datatypes ((tuple2!13814 0))(
  ( (tuple2!13815 (_1!6918 (_ BitVec 64)) (_2!6918 V!33405)) )
))
(declare-datatypes ((List!19635 0))(
  ( (Nil!19632) (Cons!19631 (h!20793 tuple2!13814) (t!27998 List!19635)) )
))
(declare-datatypes ((ListLongMap!12511 0))(
  ( (ListLongMap!12512 (toList!6271 List!19635)) )
))
(declare-fun contains!5370 (ListLongMap!12511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3504 (array!58725 array!58727 (_ BitVec 32) (_ BitVec 32) V!33405 V!33405 (_ BitVec 32) Int) ListLongMap!12511)

(assert (=> b!959993 (= lt!430599 (contains!5370 (getCurrentListMap!3504 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28236 _keys!1668) i!793)))))

(declare-fun b!959994 () Bool)

(declare-fun e!541153 () Bool)

(declare-fun e!541155 () Bool)

(declare-fun mapRes!33955 () Bool)

(assert (=> b!959994 (= e!541153 (and e!541155 mapRes!33955))))

(declare-fun condMapEmpty!33955 () Bool)

(declare-fun mapDefault!33955 () ValueCell!10177)

