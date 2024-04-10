; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82864 () Bool)

(assert start!82864)

(declare-fun b_free!18991 () Bool)

(declare-fun b_next!18991 () Bool)

(assert (=> start!82864 (= b_free!18991 (not b_next!18991))))

(declare-fun tp!66102 () Bool)

(declare-fun b_and!30479 () Bool)

(assert (=> start!82864 (= tp!66102 b_and!30479)))

(declare-fun b!966704 () Bool)

(declare-fun res!647086 () Bool)

(declare-fun e!544944 () Bool)

(assert (=> b!966704 (=> (not res!647086) (not e!544944))))

(declare-datatypes ((array!59675 0))(
  ( (array!59676 (arr!28706 (Array (_ BitVec 32) (_ BitVec 64))) (size!29185 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59675)

(declare-datatypes ((List!19927 0))(
  ( (Nil!19924) (Cons!19923 (h!21085 (_ BitVec 64)) (t!28290 List!19927)) )
))
(declare-fun arrayNoDuplicates!0 (array!59675 (_ BitVec 32) List!19927) Bool)

(assert (=> b!966704 (= res!647086 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19924))))

(declare-fun b!966705 () Bool)

(declare-fun res!647084 () Bool)

(assert (=> b!966705 (=> (not res!647084) (not e!544944))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966705 (= res!647084 (validKeyInArray!0 (select (arr!28706 _keys!1686) i!803)))))

(declare-fun b!966706 () Bool)

(declare-fun e!544946 () Bool)

(declare-fun tp_is_empty!21799 () Bool)

(assert (=> b!966706 (= e!544946 tp_is_empty!21799)))

(declare-fun b!966707 () Bool)

(declare-fun res!647083 () Bool)

(assert (=> b!966707 (=> (not res!647083) (not e!544944))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34049 0))(
  ( (V!34050 (val!10950 Int)) )
))
(declare-datatypes ((ValueCell!10418 0))(
  ( (ValueCellFull!10418 (v!13508 V!34049)) (EmptyCell!10418) )
))
(declare-datatypes ((array!59677 0))(
  ( (array!59678 (arr!28707 (Array (_ BitVec 32) ValueCell!10418)) (size!29186 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59677)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966707 (= res!647083 (and (= (size!29186 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29185 _keys!1686) (size!29186 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966708 () Bool)

(declare-fun e!544945 () Bool)

(assert (=> b!966708 (= e!544945 tp_is_empty!21799)))

(declare-fun b!966709 () Bool)

(declare-fun res!647081 () Bool)

(assert (=> b!966709 (=> (not res!647081) (not e!544944))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966709 (= res!647081 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29185 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29185 _keys!1686))))))

(declare-fun res!647085 () Bool)

(assert (=> start!82864 (=> (not res!647085) (not e!544944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82864 (= res!647085 (validMask!0 mask!2110))))

(assert (=> start!82864 e!544944))

(assert (=> start!82864 true))

(declare-fun e!544943 () Bool)

(declare-fun array_inv!22233 (array!59677) Bool)

(assert (=> start!82864 (and (array_inv!22233 _values!1400) e!544943)))

(declare-fun array_inv!22234 (array!59675) Bool)

(assert (=> start!82864 (array_inv!22234 _keys!1686)))

(assert (=> start!82864 tp!66102))

(assert (=> start!82864 tp_is_empty!21799))

(declare-fun mapIsEmpty!34693 () Bool)

(declare-fun mapRes!34693 () Bool)

(assert (=> mapIsEmpty!34693 mapRes!34693))

(declare-fun b!966710 () Bool)

(assert (=> b!966710 (= e!544944 false)))

(declare-fun minValue!1342 () V!34049)

(declare-fun lt!431353 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34049)

(declare-datatypes ((tuple2!14082 0))(
  ( (tuple2!14083 (_1!7052 (_ BitVec 64)) (_2!7052 V!34049)) )
))
(declare-datatypes ((List!19928 0))(
  ( (Nil!19925) (Cons!19924 (h!21086 tuple2!14082) (t!28291 List!19928)) )
))
(declare-datatypes ((ListLongMap!12779 0))(
  ( (ListLongMap!12780 (toList!6405 List!19928)) )
))
(declare-fun contains!5506 (ListLongMap!12779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3638 (array!59675 array!59677 (_ BitVec 32) (_ BitVec 32) V!34049 V!34049 (_ BitVec 32) Int) ListLongMap!12779)

(assert (=> b!966710 (= lt!431353 (contains!5506 (getCurrentListMap!3638 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28706 _keys!1686) i!803)))))

(declare-fun b!966711 () Bool)

(declare-fun res!647082 () Bool)

(assert (=> b!966711 (=> (not res!647082) (not e!544944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59675 (_ BitVec 32)) Bool)

(assert (=> b!966711 (= res!647082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966712 () Bool)

(assert (=> b!966712 (= e!544943 (and e!544946 mapRes!34693))))

(declare-fun condMapEmpty!34693 () Bool)

(declare-fun mapDefault!34693 () ValueCell!10418)

