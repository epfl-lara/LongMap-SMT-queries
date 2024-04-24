; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83026 () Bool)

(assert start!83026)

(declare-fun b_free!18985 () Bool)

(declare-fun b_next!18985 () Bool)

(assert (=> start!83026 (= b_free!18985 (not b_next!18985))))

(declare-fun tp!66084 () Bool)

(declare-fun b_and!30483 () Bool)

(assert (=> start!83026 (= tp!66084 b_and!30483)))

(declare-fun b!967526 () Bool)

(declare-fun e!545479 () Bool)

(assert (=> b!967526 (= e!545479 false)))

(declare-datatypes ((V!34041 0))(
  ( (V!34042 (val!10947 Int)) )
))
(declare-datatypes ((ValueCell!10415 0))(
  ( (ValueCellFull!10415 (v!13502 V!34041)) (EmptyCell!10415) )
))
(declare-datatypes ((array!59684 0))(
  ( (array!59685 (arr!28706 (Array (_ BitVec 32) ValueCell!10415)) (size!29186 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59684)

(declare-datatypes ((array!59686 0))(
  ( (array!59687 (arr!28707 (Array (_ BitVec 32) (_ BitVec 64))) (size!29187 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59686)

(declare-fun minValue!1342 () V!34041)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431705 () Bool)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34041)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14062 0))(
  ( (tuple2!14063 (_1!7042 (_ BitVec 64)) (_2!7042 V!34041)) )
))
(declare-datatypes ((List!19911 0))(
  ( (Nil!19908) (Cons!19907 (h!21075 tuple2!14062) (t!28266 List!19911)) )
))
(declare-datatypes ((ListLongMap!12761 0))(
  ( (ListLongMap!12762 (toList!6396 List!19911)) )
))
(declare-fun contains!5508 (ListLongMap!12761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3629 (array!59686 array!59684 (_ BitVec 32) (_ BitVec 32) V!34041 V!34041 (_ BitVec 32) Int) ListLongMap!12761)

(assert (=> b!967526 (= lt!431705 (contains!5508 (getCurrentListMap!3629 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28707 _keys!1686) i!803)))))

(declare-fun b!967527 () Bool)

(declare-fun e!545483 () Bool)

(declare-fun tp_is_empty!21793 () Bool)

(assert (=> b!967527 (= e!545483 tp_is_empty!21793)))

(declare-fun b!967528 () Bool)

(declare-fun res!647374 () Bool)

(assert (=> b!967528 (=> (not res!647374) (not e!545479))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967528 (= res!647374 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29187 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29187 _keys!1686))))))

(declare-fun mapNonEmpty!34684 () Bool)

(declare-fun mapRes!34684 () Bool)

(declare-fun tp!66085 () Bool)

(assert (=> mapNonEmpty!34684 (= mapRes!34684 (and tp!66085 e!545483))))

(declare-fun mapKey!34684 () (_ BitVec 32))

(declare-fun mapRest!34684 () (Array (_ BitVec 32) ValueCell!10415))

(declare-fun mapValue!34684 () ValueCell!10415)

(assert (=> mapNonEmpty!34684 (= (arr!28706 _values!1400) (store mapRest!34684 mapKey!34684 mapValue!34684))))

(declare-fun mapIsEmpty!34684 () Bool)

(assert (=> mapIsEmpty!34684 mapRes!34684))

(declare-fun b!967529 () Bool)

(declare-fun e!545481 () Bool)

(declare-fun e!545480 () Bool)

(assert (=> b!967529 (= e!545481 (and e!545480 mapRes!34684))))

(declare-fun condMapEmpty!34684 () Bool)

(declare-fun mapDefault!34684 () ValueCell!10415)

(assert (=> b!967529 (= condMapEmpty!34684 (= (arr!28706 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10415)) mapDefault!34684)))))

(declare-fun res!647375 () Bool)

(assert (=> start!83026 (=> (not res!647375) (not e!545479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83026 (= res!647375 (validMask!0 mask!2110))))

(assert (=> start!83026 e!545479))

(assert (=> start!83026 true))

(declare-fun array_inv!22285 (array!59684) Bool)

(assert (=> start!83026 (and (array_inv!22285 _values!1400) e!545481)))

(declare-fun array_inv!22286 (array!59686) Bool)

(assert (=> start!83026 (array_inv!22286 _keys!1686)))

(assert (=> start!83026 tp!66084))

(assert (=> start!83026 tp_is_empty!21793))

(declare-fun b!967530 () Bool)

(declare-fun res!647371 () Bool)

(assert (=> b!967530 (=> (not res!647371) (not e!545479))))

(declare-datatypes ((List!19912 0))(
  ( (Nil!19909) (Cons!19908 (h!21076 (_ BitVec 64)) (t!28267 List!19912)) )
))
(declare-fun arrayNoDuplicates!0 (array!59686 (_ BitVec 32) List!19912) Bool)

(assert (=> b!967530 (= res!647371 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19909))))

(declare-fun b!967531 () Bool)

(assert (=> b!967531 (= e!545480 tp_is_empty!21793)))

(declare-fun b!967532 () Bool)

(declare-fun res!647372 () Bool)

(assert (=> b!967532 (=> (not res!647372) (not e!545479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59686 (_ BitVec 32)) Bool)

(assert (=> b!967532 (= res!647372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967533 () Bool)

(declare-fun res!647373 () Bool)

(assert (=> b!967533 (=> (not res!647373) (not e!545479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967533 (= res!647373 (validKeyInArray!0 (select (arr!28707 _keys!1686) i!803)))))

(declare-fun b!967534 () Bool)

(declare-fun res!647376 () Bool)

(assert (=> b!967534 (=> (not res!647376) (not e!545479))))

(assert (=> b!967534 (= res!647376 (and (= (size!29186 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29187 _keys!1686) (size!29186 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!83026 res!647375) b!967534))

(assert (= (and b!967534 res!647376) b!967532))

(assert (= (and b!967532 res!647372) b!967530))

(assert (= (and b!967530 res!647371) b!967528))

(assert (= (and b!967528 res!647374) b!967533))

(assert (= (and b!967533 res!647373) b!967526))

(assert (= (and b!967529 condMapEmpty!34684) mapIsEmpty!34684))

(assert (= (and b!967529 (not condMapEmpty!34684)) mapNonEmpty!34684))

(get-info :version)

(assert (= (and mapNonEmpty!34684 ((_ is ValueCellFull!10415) mapValue!34684)) b!967527))

(assert (= (and b!967529 ((_ is ValueCellFull!10415) mapDefault!34684)) b!967531))

(assert (= start!83026 b!967529))

(declare-fun m!896653 () Bool)

(assert (=> mapNonEmpty!34684 m!896653))

(declare-fun m!896655 () Bool)

(assert (=> start!83026 m!896655))

(declare-fun m!896657 () Bool)

(assert (=> start!83026 m!896657))

(declare-fun m!896659 () Bool)

(assert (=> start!83026 m!896659))

(declare-fun m!896661 () Bool)

(assert (=> b!967533 m!896661))

(assert (=> b!967533 m!896661))

(declare-fun m!896663 () Bool)

(assert (=> b!967533 m!896663))

(declare-fun m!896665 () Bool)

(assert (=> b!967532 m!896665))

(declare-fun m!896667 () Bool)

(assert (=> b!967530 m!896667))

(declare-fun m!896669 () Bool)

(assert (=> b!967526 m!896669))

(assert (=> b!967526 m!896661))

(assert (=> b!967526 m!896669))

(assert (=> b!967526 m!896661))

(declare-fun m!896671 () Bool)

(assert (=> b!967526 m!896671))

(check-sat (not b!967532) (not b_next!18985) (not b!967533) (not mapNonEmpty!34684) (not b!967530) (not b!967526) b_and!30483 (not start!83026) tp_is_empty!21793)
(check-sat b_and!30483 (not b_next!18985))
