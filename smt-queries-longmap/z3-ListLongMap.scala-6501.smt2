; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83014 () Bool)

(assert start!83014)

(declare-fun b_free!18973 () Bool)

(declare-fun b_next!18973 () Bool)

(assert (=> start!83014 (= b_free!18973 (not b_next!18973))))

(declare-fun tp!66048 () Bool)

(declare-fun b_and!30471 () Bool)

(assert (=> start!83014 (= tp!66048 b_and!30471)))

(declare-fun b!967355 () Bool)

(declare-fun res!647254 () Bool)

(declare-fun e!545390 () Bool)

(assert (=> b!967355 (=> (not res!647254) (not e!545390))))

(declare-datatypes ((array!59660 0))(
  ( (array!59661 (arr!28694 (Array (_ BitVec 32) (_ BitVec 64))) (size!29174 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59660)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59660 (_ BitVec 32)) Bool)

(assert (=> b!967355 (= res!647254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967356 () Bool)

(declare-fun res!647256 () Bool)

(assert (=> b!967356 (=> (not res!647256) (not e!545390))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34025 0))(
  ( (V!34026 (val!10941 Int)) )
))
(declare-datatypes ((ValueCell!10409 0))(
  ( (ValueCellFull!10409 (v!13496 V!34025)) (EmptyCell!10409) )
))
(declare-datatypes ((array!59662 0))(
  ( (array!59663 (arr!28695 (Array (_ BitVec 32) ValueCell!10409)) (size!29175 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59662)

(assert (=> b!967356 (= res!647256 (and (= (size!29175 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29174 _keys!1686) (size!29175 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967357 () Bool)

(declare-fun e!545391 () Bool)

(declare-fun tp_is_empty!21781 () Bool)

(assert (=> b!967357 (= e!545391 tp_is_empty!21781)))

(declare-fun b!967358 () Bool)

(declare-fun e!545393 () Bool)

(declare-fun mapRes!34666 () Bool)

(assert (=> b!967358 (= e!545393 (and e!545391 mapRes!34666))))

(declare-fun condMapEmpty!34666 () Bool)

(declare-fun mapDefault!34666 () ValueCell!10409)

(assert (=> b!967358 (= condMapEmpty!34666 (= (arr!28695 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10409)) mapDefault!34666)))))

(declare-fun mapNonEmpty!34666 () Bool)

(declare-fun tp!66049 () Bool)

(declare-fun e!545389 () Bool)

(assert (=> mapNonEmpty!34666 (= mapRes!34666 (and tp!66049 e!545389))))

(declare-fun mapRest!34666 () (Array (_ BitVec 32) ValueCell!10409))

(declare-fun mapKey!34666 () (_ BitVec 32))

(declare-fun mapValue!34666 () ValueCell!10409)

(assert (=> mapNonEmpty!34666 (= (arr!28695 _values!1400) (store mapRest!34666 mapKey!34666 mapValue!34666))))

(declare-fun res!647257 () Bool)

(assert (=> start!83014 (=> (not res!647257) (not e!545390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83014 (= res!647257 (validMask!0 mask!2110))))

(assert (=> start!83014 e!545390))

(assert (=> start!83014 true))

(declare-fun array_inv!22277 (array!59662) Bool)

(assert (=> start!83014 (and (array_inv!22277 _values!1400) e!545393)))

(declare-fun array_inv!22278 (array!59660) Bool)

(assert (=> start!83014 (array_inv!22278 _keys!1686)))

(assert (=> start!83014 tp!66048))

(assert (=> start!83014 tp_is_empty!21781))

(declare-fun b!967359 () Bool)

(declare-fun res!647259 () Bool)

(assert (=> b!967359 (=> (not res!647259) (not e!545390))))

(declare-datatypes ((List!19902 0))(
  ( (Nil!19899) (Cons!19898 (h!21066 (_ BitVec 64)) (t!28257 List!19902)) )
))
(declare-fun arrayNoDuplicates!0 (array!59660 (_ BitVec 32) List!19902) Bool)

(assert (=> b!967359 (= res!647259 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19899))))

(declare-fun b!967360 () Bool)

(assert (=> b!967360 (= e!545389 tp_is_empty!21781)))

(declare-fun b!967361 () Bool)

(declare-fun res!647258 () Bool)

(assert (=> b!967361 (=> (not res!647258) (not e!545390))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967361 (= res!647258 (validKeyInArray!0 (select (arr!28694 _keys!1686) i!803)))))

(declare-fun b!967362 () Bool)

(assert (=> b!967362 (= e!545390 false)))

(declare-fun minValue!1342 () V!34025)

(declare-fun zeroValue!1342 () V!34025)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lt!431696 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14054 0))(
  ( (tuple2!14055 (_1!7038 (_ BitVec 64)) (_2!7038 V!34025)) )
))
(declare-datatypes ((List!19903 0))(
  ( (Nil!19900) (Cons!19899 (h!21067 tuple2!14054) (t!28258 List!19903)) )
))
(declare-datatypes ((ListLongMap!12753 0))(
  ( (ListLongMap!12754 (toList!6392 List!19903)) )
))
(declare-fun contains!5504 (ListLongMap!12753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3625 (array!59660 array!59662 (_ BitVec 32) (_ BitVec 32) V!34025 V!34025 (_ BitVec 32) Int) ListLongMap!12753)

(assert (=> b!967362 (= lt!431696 (contains!5504 (getCurrentListMap!3625 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28694 _keys!1686) i!803)))))

(declare-fun b!967363 () Bool)

(declare-fun res!647255 () Bool)

(assert (=> b!967363 (=> (not res!647255) (not e!545390))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967363 (= res!647255 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29174 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29174 _keys!1686))))))

(declare-fun mapIsEmpty!34666 () Bool)

(assert (=> mapIsEmpty!34666 mapRes!34666))

(assert (= (and start!83014 res!647257) b!967356))

(assert (= (and b!967356 res!647256) b!967355))

(assert (= (and b!967355 res!647254) b!967359))

(assert (= (and b!967359 res!647259) b!967363))

(assert (= (and b!967363 res!647255) b!967361))

(assert (= (and b!967361 res!647258) b!967362))

(assert (= (and b!967358 condMapEmpty!34666) mapIsEmpty!34666))

(assert (= (and b!967358 (not condMapEmpty!34666)) mapNonEmpty!34666))

(get-info :version)

(assert (= (and mapNonEmpty!34666 ((_ is ValueCellFull!10409) mapValue!34666)) b!967360))

(assert (= (and b!967358 ((_ is ValueCellFull!10409) mapDefault!34666)) b!967357))

(assert (= start!83014 b!967358))

(declare-fun m!896533 () Bool)

(assert (=> b!967362 m!896533))

(declare-fun m!896535 () Bool)

(assert (=> b!967362 m!896535))

(assert (=> b!967362 m!896533))

(assert (=> b!967362 m!896535))

(declare-fun m!896537 () Bool)

(assert (=> b!967362 m!896537))

(declare-fun m!896539 () Bool)

(assert (=> start!83014 m!896539))

(declare-fun m!896541 () Bool)

(assert (=> start!83014 m!896541))

(declare-fun m!896543 () Bool)

(assert (=> start!83014 m!896543))

(declare-fun m!896545 () Bool)

(assert (=> b!967359 m!896545))

(declare-fun m!896547 () Bool)

(assert (=> mapNonEmpty!34666 m!896547))

(assert (=> b!967361 m!896535))

(assert (=> b!967361 m!896535))

(declare-fun m!896549 () Bool)

(assert (=> b!967361 m!896549))

(declare-fun m!896551 () Bool)

(assert (=> b!967355 m!896551))

(check-sat (not b!967361) (not b_next!18973) (not mapNonEmpty!34666) (not b!967359) b_and!30471 tp_is_empty!21781 (not b!967362) (not start!83014) (not b!967355))
(check-sat b_and!30471 (not b_next!18973))
