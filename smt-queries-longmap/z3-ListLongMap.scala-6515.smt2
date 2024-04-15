; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82912 () Bool)

(assert start!82912)

(declare-fun b_free!19057 () Bool)

(declare-fun b_next!19057 () Bool)

(assert (=> start!82912 (= b_free!19057 (not b_next!19057))))

(declare-fun tp!66301 () Bool)

(declare-fun b_and!30519 () Bool)

(assert (=> start!82912 (= tp!66301 b_and!30519)))

(declare-fun b!967540 () Bool)

(declare-fun e!545289 () Bool)

(declare-fun tp_is_empty!21865 () Bool)

(assert (=> b!967540 (= e!545289 tp_is_empty!21865)))

(declare-fun mapIsEmpty!34792 () Bool)

(declare-fun mapRes!34792 () Bool)

(assert (=> mapIsEmpty!34792 mapRes!34792))

(declare-fun b!967541 () Bool)

(declare-fun res!647755 () Bool)

(declare-fun e!545292 () Bool)

(assert (=> b!967541 (=> (not res!647755) (not e!545292))))

(declare-datatypes ((array!59734 0))(
  ( (array!59735 (arr!28736 (Array (_ BitVec 32) (_ BitVec 64))) (size!29217 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59734)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967541 (= res!647755 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29217 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29217 _keys!1686))))))

(declare-fun b!967542 () Bool)

(declare-fun res!647754 () Bool)

(assert (=> b!967542 (=> (not res!647754) (not e!545292))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34137 0))(
  ( (V!34138 (val!10983 Int)) )
))
(declare-datatypes ((ValueCell!10451 0))(
  ( (ValueCellFull!10451 (v!13540 V!34137)) (EmptyCell!10451) )
))
(declare-datatypes ((array!59736 0))(
  ( (array!59737 (arr!28737 (Array (_ BitVec 32) ValueCell!10451)) (size!29218 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59736)

(declare-fun minValue!1342 () V!34137)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34137)

(declare-datatypes ((tuple2!14204 0))(
  ( (tuple2!14205 (_1!7113 (_ BitVec 64)) (_2!7113 V!34137)) )
))
(declare-datatypes ((List!20006 0))(
  ( (Nil!20003) (Cons!20002 (h!21164 tuple2!14204) (t!28360 List!20006)) )
))
(declare-datatypes ((ListLongMap!12891 0))(
  ( (ListLongMap!12892 (toList!6461 List!20006)) )
))
(declare-fun contains!5506 (ListLongMap!12891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3623 (array!59734 array!59736 (_ BitVec 32) (_ BitVec 32) V!34137 V!34137 (_ BitVec 32) Int) ListLongMap!12891)

(assert (=> b!967542 (= res!647754 (contains!5506 (getCurrentListMap!3623 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28736 _keys!1686) i!803)))))

(declare-fun b!967543 () Bool)

(declare-fun res!647752 () Bool)

(assert (=> b!967543 (=> (not res!647752) (not e!545292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59734 (_ BitVec 32)) Bool)

(assert (=> b!967543 (= res!647752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967544 () Bool)

(assert (=> b!967544 (= e!545292 (not (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29217 _keys!1686)) (bvsge i!803 (bvsub from!2084 #b00000000000000000000000000000001)))))))

(assert (=> b!967544 (contains!5506 (getCurrentListMap!3623 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28736 _keys!1686) i!803))))

(declare-datatypes ((Unit!32212 0))(
  ( (Unit!32213) )
))
(declare-fun lt!431216 () Unit!32212)

(declare-fun lemmaInListMapFromThenInFromMinusOne!70 (array!59734 array!59736 (_ BitVec 32) (_ BitVec 32) V!34137 V!34137 (_ BitVec 32) (_ BitVec 32) Int) Unit!32212)

(assert (=> b!967544 (= lt!431216 (lemmaInListMapFromThenInFromMinusOne!70 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967545 () Bool)

(declare-fun res!647756 () Bool)

(assert (=> b!967545 (=> (not res!647756) (not e!545292))))

(assert (=> b!967545 (= res!647756 (and (= (size!29218 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29217 _keys!1686) (size!29218 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34792 () Bool)

(declare-fun tp!66300 () Bool)

(declare-fun e!545293 () Bool)

(assert (=> mapNonEmpty!34792 (= mapRes!34792 (and tp!66300 e!545293))))

(declare-fun mapKey!34792 () (_ BitVec 32))

(declare-fun mapRest!34792 () (Array (_ BitVec 32) ValueCell!10451))

(declare-fun mapValue!34792 () ValueCell!10451)

(assert (=> mapNonEmpty!34792 (= (arr!28737 _values!1400) (store mapRest!34792 mapKey!34792 mapValue!34792))))

(declare-fun b!967546 () Bool)

(declare-fun res!647753 () Bool)

(assert (=> b!967546 (=> (not res!647753) (not e!545292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967546 (= res!647753 (validKeyInArray!0 (select (arr!28736 _keys!1686) i!803)))))

(declare-fun res!647751 () Bool)

(assert (=> start!82912 (=> (not res!647751) (not e!545292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82912 (= res!647751 (validMask!0 mask!2110))))

(assert (=> start!82912 e!545292))

(assert (=> start!82912 true))

(declare-fun e!545290 () Bool)

(declare-fun array_inv!22315 (array!59736) Bool)

(assert (=> start!82912 (and (array_inv!22315 _values!1400) e!545290)))

(declare-fun array_inv!22316 (array!59734) Bool)

(assert (=> start!82912 (array_inv!22316 _keys!1686)))

(assert (=> start!82912 tp!66301))

(assert (=> start!82912 tp_is_empty!21865))

(declare-fun b!967547 () Bool)

(assert (=> b!967547 (= e!545290 (and e!545289 mapRes!34792))))

(declare-fun condMapEmpty!34792 () Bool)

(declare-fun mapDefault!34792 () ValueCell!10451)

(assert (=> b!967547 (= condMapEmpty!34792 (= (arr!28737 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10451)) mapDefault!34792)))))

(declare-fun b!967548 () Bool)

(declare-fun res!647749 () Bool)

(assert (=> b!967548 (=> (not res!647749) (not e!545292))))

(declare-datatypes ((List!20007 0))(
  ( (Nil!20004) (Cons!20003 (h!21165 (_ BitVec 64)) (t!28361 List!20007)) )
))
(declare-fun arrayNoDuplicates!0 (array!59734 (_ BitVec 32) List!20007) Bool)

(assert (=> b!967548 (= res!647749 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!20004))))

(declare-fun b!967549 () Bool)

(declare-fun res!647750 () Bool)

(assert (=> b!967549 (=> (not res!647750) (not e!545292))))

(assert (=> b!967549 (= res!647750 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967550 () Bool)

(assert (=> b!967550 (= e!545293 tp_is_empty!21865)))

(assert (= (and start!82912 res!647751) b!967545))

(assert (= (and b!967545 res!647756) b!967543))

(assert (= (and b!967543 res!647752) b!967548))

(assert (= (and b!967548 res!647749) b!967541))

(assert (= (and b!967541 res!647755) b!967546))

(assert (= (and b!967546 res!647753) b!967542))

(assert (= (and b!967542 res!647754) b!967549))

(assert (= (and b!967549 res!647750) b!967544))

(assert (= (and b!967547 condMapEmpty!34792) mapIsEmpty!34792))

(assert (= (and b!967547 (not condMapEmpty!34792)) mapNonEmpty!34792))

(get-info :version)

(assert (= (and mapNonEmpty!34792 ((_ is ValueCellFull!10451) mapValue!34792)) b!967550))

(assert (= (and b!967547 ((_ is ValueCellFull!10451) mapDefault!34792)) b!967540))

(assert (= start!82912 b!967547))

(declare-fun m!895501 () Bool)

(assert (=> b!967542 m!895501))

(declare-fun m!895503 () Bool)

(assert (=> b!967542 m!895503))

(assert (=> b!967542 m!895501))

(assert (=> b!967542 m!895503))

(declare-fun m!895505 () Bool)

(assert (=> b!967542 m!895505))

(declare-fun m!895507 () Bool)

(assert (=> b!967544 m!895507))

(assert (=> b!967544 m!895503))

(assert (=> b!967544 m!895507))

(assert (=> b!967544 m!895503))

(declare-fun m!895509 () Bool)

(assert (=> b!967544 m!895509))

(declare-fun m!895511 () Bool)

(assert (=> b!967544 m!895511))

(declare-fun m!895513 () Bool)

(assert (=> b!967548 m!895513))

(declare-fun m!895515 () Bool)

(assert (=> b!967543 m!895515))

(declare-fun m!895517 () Bool)

(assert (=> start!82912 m!895517))

(declare-fun m!895519 () Bool)

(assert (=> start!82912 m!895519))

(declare-fun m!895521 () Bool)

(assert (=> start!82912 m!895521))

(assert (=> b!967546 m!895503))

(assert (=> b!967546 m!895503))

(declare-fun m!895523 () Bool)

(assert (=> b!967546 m!895523))

(declare-fun m!895525 () Bool)

(assert (=> mapNonEmpty!34792 m!895525))

(check-sat (not b!967542) tp_is_empty!21865 b_and!30519 (not start!82912) (not b!967543) (not b_next!19057) (not mapNonEmpty!34792) (not b!967548) (not b!967544) (not b!967546))
(check-sat b_and!30519 (not b_next!19057))
