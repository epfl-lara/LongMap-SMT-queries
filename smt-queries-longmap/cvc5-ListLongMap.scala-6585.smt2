; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83394 () Bool)

(assert start!83394)

(declare-fun b_free!19387 () Bool)

(declare-fun b_next!19387 () Bool)

(assert (=> start!83394 (= b_free!19387 (not b_next!19387))))

(declare-fun tp!67440 () Bool)

(declare-fun b_and!30989 () Bool)

(assert (=> start!83394 (= tp!67440 b_and!30989)))

(declare-fun b!973894 () Bool)

(declare-fun e!548953 () Bool)

(declare-fun tp_is_empty!22285 () Bool)

(assert (=> b!973894 (= e!548953 tp_is_empty!22285)))

(declare-fun b!973895 () Bool)

(declare-fun res!651910 () Bool)

(declare-fun e!548952 () Bool)

(assert (=> b!973895 (=> (not res!651910) (not e!548952))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34697 0))(
  ( (V!34698 (val!11193 Int)) )
))
(declare-datatypes ((ValueCell!10661 0))(
  ( (ValueCellFull!10661 (v!13752 V!34697)) (EmptyCell!10661) )
))
(declare-datatypes ((array!60611 0))(
  ( (array!60612 (arr!29169 (Array (_ BitVec 32) ValueCell!10661)) (size!29648 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60611)

(declare-fun zeroValue!1367 () V!34697)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34697)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60613 0))(
  ( (array!60614 (arr!29170 (Array (_ BitVec 32) (_ BitVec 64))) (size!29649 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60613)

(declare-datatypes ((tuple2!14378 0))(
  ( (tuple2!14379 (_1!7200 (_ BitVec 64)) (_2!7200 V!34697)) )
))
(declare-datatypes ((List!20237 0))(
  ( (Nil!20234) (Cons!20233 (h!21395 tuple2!14378) (t!28714 List!20237)) )
))
(declare-datatypes ((ListLongMap!13075 0))(
  ( (ListLongMap!13076 (toList!6553 List!20237)) )
))
(declare-fun contains!5643 (ListLongMap!13075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3786 (array!60613 array!60611 (_ BitVec 32) (_ BitVec 32) V!34697 V!34697 (_ BitVec 32) Int) ListLongMap!13075)

(assert (=> b!973895 (= res!651910 (contains!5643 (getCurrentListMap!3786 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29170 _keys!1717) i!822)))))

(declare-fun b!973896 () Bool)

(declare-fun res!651911 () Bool)

(assert (=> b!973896 (=> (not res!651911) (not e!548952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973896 (= res!651911 (validKeyInArray!0 (select (arr!29170 _keys!1717) i!822)))))

(declare-fun res!651909 () Bool)

(assert (=> start!83394 (=> (not res!651909) (not e!548952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83394 (= res!651909 (validMask!0 mask!2147))))

(assert (=> start!83394 e!548952))

(assert (=> start!83394 true))

(declare-fun e!548954 () Bool)

(declare-fun array_inv!22561 (array!60611) Bool)

(assert (=> start!83394 (and (array_inv!22561 _values!1425) e!548954)))

(assert (=> start!83394 tp_is_empty!22285))

(assert (=> start!83394 tp!67440))

(declare-fun array_inv!22562 (array!60613) Bool)

(assert (=> start!83394 (array_inv!22562 _keys!1717)))

(declare-fun b!973897 () Bool)

(declare-fun res!651908 () Bool)

(assert (=> b!973897 (=> (not res!651908) (not e!548952))))

(declare-datatypes ((List!20238 0))(
  ( (Nil!20235) (Cons!20234 (h!21396 (_ BitVec 64)) (t!28715 List!20238)) )
))
(declare-fun arrayNoDuplicates!0 (array!60613 (_ BitVec 32) List!20238) Bool)

(assert (=> b!973897 (= res!651908 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20235))))

(declare-fun b!973898 () Bool)

(declare-fun res!651912 () Bool)

(assert (=> b!973898 (=> (not res!651912) (not e!548952))))

(assert (=> b!973898 (= res!651912 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29649 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29649 _keys!1717))))))

(declare-fun mapIsEmpty!35437 () Bool)

(declare-fun mapRes!35437 () Bool)

(assert (=> mapIsEmpty!35437 mapRes!35437))

(declare-fun b!973899 () Bool)

(assert (=> b!973899 (= e!548952 false)))

(declare-fun lt!432716 () ListLongMap!13075)

(assert (=> b!973899 (= lt!432716 (getCurrentListMap!3786 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973900 () Bool)

(declare-fun res!651906 () Bool)

(assert (=> b!973900 (=> (not res!651906) (not e!548952))))

(assert (=> b!973900 (= res!651906 (and (= (size!29648 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29649 _keys!1717) (size!29648 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973901 () Bool)

(declare-fun res!651907 () Bool)

(assert (=> b!973901 (=> (not res!651907) (not e!548952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60613 (_ BitVec 32)) Bool)

(assert (=> b!973901 (= res!651907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973902 () Bool)

(assert (=> b!973902 (= e!548954 (and e!548953 mapRes!35437))))

(declare-fun condMapEmpty!35437 () Bool)

(declare-fun mapDefault!35437 () ValueCell!10661)

