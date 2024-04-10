; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82274 () Bool)

(assert start!82274)

(declare-fun b_free!18547 () Bool)

(declare-fun b_next!18547 () Bool)

(assert (=> start!82274 (= b_free!18547 (not b_next!18547))))

(declare-fun tp!64602 () Bool)

(declare-fun b_and!30035 () Bool)

(assert (=> start!82274 (= tp!64602 b_and!30035)))

(declare-fun b!959092 () Bool)

(declare-fun e!540675 () Bool)

(assert (=> b!959092 (= e!540675 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33321 0))(
  ( (V!33322 (val!10677 Int)) )
))
(declare-fun minValue!1328 () V!33321)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58603 0))(
  ( (array!58604 (arr!28175 (Array (_ BitVec 32) (_ BitVec 64))) (size!28654 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58603)

(declare-datatypes ((ValueCell!10145 0))(
  ( (ValueCellFull!10145 (v!13234 V!33321)) (EmptyCell!10145) )
))
(declare-datatypes ((array!58605 0))(
  ( (array!58606 (arr!28176 (Array (_ BitVec 32) ValueCell!10145)) (size!28655 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58605)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33321)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13770 0))(
  ( (tuple2!13771 (_1!6896 (_ BitVec 64)) (_2!6896 V!33321)) )
))
(declare-datatypes ((List!19589 0))(
  ( (Nil!19586) (Cons!19585 (h!20747 tuple2!13770) (t!27952 List!19589)) )
))
(declare-datatypes ((ListLongMap!12467 0))(
  ( (ListLongMap!12468 (toList!6249 List!19589)) )
))
(declare-fun contains!5350 (ListLongMap!12467 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3482 (array!58603 array!58605 (_ BitVec 32) (_ BitVec 32) V!33321 V!33321 (_ BitVec 32) Int) ListLongMap!12467)

(assert (=> b!959092 (contains!5350 (getCurrentListMap!3482 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28175 _keys!1668) i!793))))

(declare-datatypes ((Unit!32173 0))(
  ( (Unit!32174) )
))
(declare-fun lt!430512 () Unit!32173)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!8 (array!58603 array!58605 (_ BitVec 32) (_ BitVec 32) V!33321 V!33321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32173)

(assert (=> b!959092 (= lt!430512 (lemmaInListMapFromThenInFromSmaller!8 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959093 () Bool)

(declare-fun res!641996 () Bool)

(assert (=> b!959093 (=> (not res!641996) (not e!540675))))

(assert (=> b!959093 (= res!641996 (and (= (size!28655 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28654 _keys!1668) (size!28655 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959094 () Bool)

(declare-fun res!641994 () Bool)

(assert (=> b!959094 (=> (not res!641994) (not e!540675))))

(assert (=> b!959094 (= res!641994 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28654 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28654 _keys!1668))))))

(declare-fun b!959095 () Bool)

(declare-fun res!641991 () Bool)

(assert (=> b!959095 (=> (not res!641991) (not e!540675))))

(assert (=> b!959095 (= res!641991 (contains!5350 (getCurrentListMap!3482 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28175 _keys!1668) i!793)))))

(declare-fun b!959096 () Bool)

(declare-fun res!641992 () Bool)

(assert (=> b!959096 (=> (not res!641992) (not e!540675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58603 (_ BitVec 32)) Bool)

(assert (=> b!959096 (= res!641992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959097 () Bool)

(declare-fun e!540672 () Bool)

(declare-fun tp_is_empty!21253 () Bool)

(assert (=> b!959097 (= e!540672 tp_is_empty!21253)))

(declare-fun mapIsEmpty!33859 () Bool)

(declare-fun mapRes!33859 () Bool)

(assert (=> mapIsEmpty!33859 mapRes!33859))

(declare-fun b!959098 () Bool)

(declare-fun e!540673 () Bool)

(assert (=> b!959098 (= e!540673 tp_is_empty!21253)))

(declare-fun b!959100 () Bool)

(declare-fun res!641995 () Bool)

(assert (=> b!959100 (=> (not res!641995) (not e!540675))))

(declare-datatypes ((List!19590 0))(
  ( (Nil!19587) (Cons!19586 (h!20748 (_ BitVec 64)) (t!27953 List!19590)) )
))
(declare-fun arrayNoDuplicates!0 (array!58603 (_ BitVec 32) List!19590) Bool)

(assert (=> b!959100 (= res!641995 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19587))))

(declare-fun mapNonEmpty!33859 () Bool)

(declare-fun tp!64601 () Bool)

(assert (=> mapNonEmpty!33859 (= mapRes!33859 (and tp!64601 e!540672))))

(declare-fun mapValue!33859 () ValueCell!10145)

(declare-fun mapKey!33859 () (_ BitVec 32))

(declare-fun mapRest!33859 () (Array (_ BitVec 32) ValueCell!10145))

(assert (=> mapNonEmpty!33859 (= (arr!28176 _values!1386) (store mapRest!33859 mapKey!33859 mapValue!33859))))

(declare-fun b!959101 () Bool)

(declare-fun e!540671 () Bool)

(assert (=> b!959101 (= e!540671 (and e!540673 mapRes!33859))))

(declare-fun condMapEmpty!33859 () Bool)

(declare-fun mapDefault!33859 () ValueCell!10145)

