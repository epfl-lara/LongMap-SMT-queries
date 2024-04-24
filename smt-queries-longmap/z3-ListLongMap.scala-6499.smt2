; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83002 () Bool)

(assert start!83002)

(declare-fun b_free!18961 () Bool)

(declare-fun b_next!18961 () Bool)

(assert (=> start!83002 (= b_free!18961 (not b_next!18961))))

(declare-fun tp!66012 () Bool)

(declare-fun b_and!30459 () Bool)

(assert (=> start!83002 (= tp!66012 b_and!30459)))

(declare-fun b!967193 () Bool)

(declare-fun e!545300 () Bool)

(declare-fun e!545303 () Bool)

(declare-fun mapRes!34648 () Bool)

(assert (=> b!967193 (= e!545300 (and e!545303 mapRes!34648))))

(declare-fun condMapEmpty!34648 () Bool)

(declare-datatypes ((V!34009 0))(
  ( (V!34010 (val!10935 Int)) )
))
(declare-datatypes ((ValueCell!10403 0))(
  ( (ValueCellFull!10403 (v!13490 V!34009)) (EmptyCell!10403) )
))
(declare-datatypes ((array!59636 0))(
  ( (array!59637 (arr!28682 (Array (_ BitVec 32) ValueCell!10403)) (size!29162 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59636)

(declare-fun mapDefault!34648 () ValueCell!10403)

(assert (=> b!967193 (= condMapEmpty!34648 (= (arr!28682 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10403)) mapDefault!34648)))))

(declare-fun mapIsEmpty!34648 () Bool)

(assert (=> mapIsEmpty!34648 mapRes!34648))

(declare-fun b!967194 () Bool)

(declare-fun res!647150 () Bool)

(declare-fun e!545302 () Bool)

(assert (=> b!967194 (=> (not res!647150) (not e!545302))))

(declare-datatypes ((array!59638 0))(
  ( (array!59639 (arr!28683 (Array (_ BitVec 32) (_ BitVec 64))) (size!29163 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59638)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967194 (= res!647150 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29163 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29163 _keys!1686))))))

(declare-fun b!967195 () Bool)

(declare-fun res!647148 () Bool)

(assert (=> b!967195 (=> (not res!647148) (not e!545302))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59638 (_ BitVec 32)) Bool)

(assert (=> b!967195 (= res!647148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967196 () Bool)

(declare-fun res!647149 () Bool)

(assert (=> b!967196 (=> (not res!647149) (not e!545302))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967196 (= res!647149 (and (= (size!29162 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29163 _keys!1686) (size!29162 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967197 () Bool)

(declare-fun res!647151 () Bool)

(assert (=> b!967197 (=> (not res!647151) (not e!545302))))

(declare-datatypes ((List!19895 0))(
  ( (Nil!19892) (Cons!19891 (h!21059 (_ BitVec 64)) (t!28250 List!19895)) )
))
(declare-fun arrayNoDuplicates!0 (array!59638 (_ BitVec 32) List!19895) Bool)

(assert (=> b!967197 (= res!647151 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19892))))

(declare-fun res!647146 () Bool)

(assert (=> start!83002 (=> (not res!647146) (not e!545302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83002 (= res!647146 (validMask!0 mask!2110))))

(assert (=> start!83002 e!545302))

(assert (=> start!83002 true))

(declare-fun array_inv!22271 (array!59636) Bool)

(assert (=> start!83002 (and (array_inv!22271 _values!1400) e!545300)))

(declare-fun array_inv!22272 (array!59638) Bool)

(assert (=> start!83002 (array_inv!22272 _keys!1686)))

(assert (=> start!83002 tp!66012))

(declare-fun tp_is_empty!21769 () Bool)

(assert (=> start!83002 tp_is_empty!21769))

(declare-fun b!967198 () Bool)

(declare-fun res!647147 () Bool)

(assert (=> b!967198 (=> (not res!647147) (not e!545302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967198 (= res!647147 (validKeyInArray!0 (select (arr!28683 _keys!1686) i!803)))))

(declare-fun b!967199 () Bool)

(declare-fun e!545299 () Bool)

(assert (=> b!967199 (= e!545299 tp_is_empty!21769)))

(declare-fun b!967200 () Bool)

(assert (=> b!967200 (= e!545303 tp_is_empty!21769)))

(declare-fun b!967201 () Bool)

(assert (=> b!967201 (= e!545302 false)))

(declare-fun lt!431678 () Bool)

(declare-fun minValue!1342 () V!34009)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34009)

(declare-datatypes ((tuple2!14046 0))(
  ( (tuple2!14047 (_1!7034 (_ BitVec 64)) (_2!7034 V!34009)) )
))
(declare-datatypes ((List!19896 0))(
  ( (Nil!19893) (Cons!19892 (h!21060 tuple2!14046) (t!28251 List!19896)) )
))
(declare-datatypes ((ListLongMap!12745 0))(
  ( (ListLongMap!12746 (toList!6388 List!19896)) )
))
(declare-fun contains!5500 (ListLongMap!12745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3621 (array!59638 array!59636 (_ BitVec 32) (_ BitVec 32) V!34009 V!34009 (_ BitVec 32) Int) ListLongMap!12745)

(assert (=> b!967201 (= lt!431678 (contains!5500 (getCurrentListMap!3621 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28683 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34648 () Bool)

(declare-fun tp!66013 () Bool)

(assert (=> mapNonEmpty!34648 (= mapRes!34648 (and tp!66013 e!545299))))

(declare-fun mapValue!34648 () ValueCell!10403)

(declare-fun mapKey!34648 () (_ BitVec 32))

(declare-fun mapRest!34648 () (Array (_ BitVec 32) ValueCell!10403))

(assert (=> mapNonEmpty!34648 (= (arr!28682 _values!1400) (store mapRest!34648 mapKey!34648 mapValue!34648))))

(assert (= (and start!83002 res!647146) b!967196))

(assert (= (and b!967196 res!647149) b!967195))

(assert (= (and b!967195 res!647148) b!967197))

(assert (= (and b!967197 res!647151) b!967194))

(assert (= (and b!967194 res!647150) b!967198))

(assert (= (and b!967198 res!647147) b!967201))

(assert (= (and b!967193 condMapEmpty!34648) mapIsEmpty!34648))

(assert (= (and b!967193 (not condMapEmpty!34648)) mapNonEmpty!34648))

(get-info :version)

(assert (= (and mapNonEmpty!34648 ((_ is ValueCellFull!10403) mapValue!34648)) b!967199))

(assert (= (and b!967193 ((_ is ValueCellFull!10403) mapDefault!34648)) b!967200))

(assert (= start!83002 b!967193))

(declare-fun m!896413 () Bool)

(assert (=> b!967197 m!896413))

(declare-fun m!896415 () Bool)

(assert (=> b!967201 m!896415))

(declare-fun m!896417 () Bool)

(assert (=> b!967201 m!896417))

(assert (=> b!967201 m!896415))

(assert (=> b!967201 m!896417))

(declare-fun m!896419 () Bool)

(assert (=> b!967201 m!896419))

(declare-fun m!896421 () Bool)

(assert (=> start!83002 m!896421))

(declare-fun m!896423 () Bool)

(assert (=> start!83002 m!896423))

(declare-fun m!896425 () Bool)

(assert (=> start!83002 m!896425))

(assert (=> b!967198 m!896417))

(assert (=> b!967198 m!896417))

(declare-fun m!896427 () Bool)

(assert (=> b!967198 m!896427))

(declare-fun m!896429 () Bool)

(assert (=> mapNonEmpty!34648 m!896429))

(declare-fun m!896431 () Bool)

(assert (=> b!967195 m!896431))

(check-sat (not b!967197) tp_is_empty!21769 (not b_next!18961) (not b!967195) (not start!83002) b_and!30459 (not b!967198) (not b!967201) (not mapNonEmpty!34648))
(check-sat b_and!30459 (not b_next!18961))
