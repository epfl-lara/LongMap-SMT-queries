; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82878 () Bool)

(assert start!82878)

(declare-fun b_free!19005 () Bool)

(declare-fun b_next!19005 () Bool)

(assert (=> start!82878 (= b_free!19005 (not b_next!19005))))

(declare-fun tp!66143 () Bool)

(declare-fun b_and!30493 () Bool)

(assert (=> start!82878 (= tp!66143 b_and!30493)))

(declare-fun b!966921 () Bool)

(declare-fun e!545050 () Bool)

(assert (=> b!966921 (= e!545050 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34067 0))(
  ( (V!34068 (val!10957 Int)) )
))
(declare-datatypes ((ValueCell!10425 0))(
  ( (ValueCellFull!10425 (v!13515 V!34067)) (EmptyCell!10425) )
))
(declare-datatypes ((array!59703 0))(
  ( (array!59704 (arr!28720 (Array (_ BitVec 32) ValueCell!10425)) (size!29199 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59703)

(declare-datatypes ((array!59705 0))(
  ( (array!59706 (arr!28721 (Array (_ BitVec 32) (_ BitVec 64))) (size!29200 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59705)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34067)

(declare-fun zeroValue!1342 () V!34067)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14092 0))(
  ( (tuple2!14093 (_1!7057 (_ BitVec 64)) (_2!7057 V!34067)) )
))
(declare-datatypes ((List!19939 0))(
  ( (Nil!19936) (Cons!19935 (h!21097 tuple2!14092) (t!28302 List!19939)) )
))
(declare-datatypes ((ListLongMap!12789 0))(
  ( (ListLongMap!12790 (toList!6410 List!19939)) )
))
(declare-fun contains!5511 (ListLongMap!12789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3643 (array!59705 array!59703 (_ BitVec 32) (_ BitVec 32) V!34067 V!34067 (_ BitVec 32) Int) ListLongMap!12789)

(assert (=> b!966921 (contains!5511 (getCurrentListMap!3643 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28721 _keys!1686) i!803))))

(declare-datatypes ((Unit!32305 0))(
  ( (Unit!32306) )
))
(declare-fun lt!431374 () Unit!32305)

(declare-fun lemmaInListMapFromThenInFromMinusOne!47 (array!59705 array!59703 (_ BitVec 32) (_ BitVec 32) V!34067 V!34067 (_ BitVec 32) (_ BitVec 32) Int) Unit!32305)

(assert (=> b!966921 (= lt!431374 (lemmaInListMapFromThenInFromMinusOne!47 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34714 () Bool)

(declare-fun mapRes!34714 () Bool)

(declare-fun tp!66144 () Bool)

(declare-fun e!545051 () Bool)

(assert (=> mapNonEmpty!34714 (= mapRes!34714 (and tp!66144 e!545051))))

(declare-fun mapValue!34714 () ValueCell!10425)

(declare-fun mapRest!34714 () (Array (_ BitVec 32) ValueCell!10425))

(declare-fun mapKey!34714 () (_ BitVec 32))

(assert (=> mapNonEmpty!34714 (= (arr!28720 _values!1400) (store mapRest!34714 mapKey!34714 mapValue!34714))))

(declare-fun b!966922 () Bool)

(declare-fun res!647236 () Bool)

(assert (=> b!966922 (=> (not res!647236) (not e!545050))))

(assert (=> b!966922 (= res!647236 (contains!5511 (getCurrentListMap!3643 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28721 _keys!1686) i!803)))))

(declare-fun b!966923 () Bool)

(declare-fun res!647239 () Bool)

(assert (=> b!966923 (=> (not res!647239) (not e!545050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966923 (= res!647239 (validKeyInArray!0 (select (arr!28721 _keys!1686) i!803)))))

(declare-fun b!966924 () Bool)

(declare-fun res!647237 () Bool)

(assert (=> b!966924 (=> (not res!647237) (not e!545050))))

(assert (=> b!966924 (= res!647237 (and (= (size!29199 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29200 _keys!1686) (size!29199 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966925 () Bool)

(declare-fun e!545048 () Bool)

(declare-fun tp_is_empty!21813 () Bool)

(assert (=> b!966925 (= e!545048 tp_is_empty!21813)))

(declare-fun b!966926 () Bool)

(declare-fun res!647242 () Bool)

(assert (=> b!966926 (=> (not res!647242) (not e!545050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59705 (_ BitVec 32)) Bool)

(assert (=> b!966926 (= res!647242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966927 () Bool)

(assert (=> b!966927 (= e!545051 tp_is_empty!21813)))

(declare-fun mapIsEmpty!34714 () Bool)

(assert (=> mapIsEmpty!34714 mapRes!34714))

(declare-fun b!966928 () Bool)

(declare-fun res!647238 () Bool)

(assert (=> b!966928 (=> (not res!647238) (not e!545050))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966928 (= res!647238 (bvsgt from!2084 newFrom!159))))

(declare-fun b!966929 () Bool)

(declare-fun res!647235 () Bool)

(assert (=> b!966929 (=> (not res!647235) (not e!545050))))

(declare-datatypes ((List!19940 0))(
  ( (Nil!19937) (Cons!19936 (h!21098 (_ BitVec 64)) (t!28303 List!19940)) )
))
(declare-fun arrayNoDuplicates!0 (array!59705 (_ BitVec 32) List!19940) Bool)

(assert (=> b!966929 (= res!647235 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19937))))

(declare-fun res!647240 () Bool)

(assert (=> start!82878 (=> (not res!647240) (not e!545050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82878 (= res!647240 (validMask!0 mask!2110))))

(assert (=> start!82878 e!545050))

(assert (=> start!82878 true))

(declare-fun e!545047 () Bool)

(declare-fun array_inv!22243 (array!59703) Bool)

(assert (=> start!82878 (and (array_inv!22243 _values!1400) e!545047)))

(declare-fun array_inv!22244 (array!59705) Bool)

(assert (=> start!82878 (array_inv!22244 _keys!1686)))

(assert (=> start!82878 tp!66143))

(assert (=> start!82878 tp_is_empty!21813))

(declare-fun b!966930 () Bool)

(assert (=> b!966930 (= e!545047 (and e!545048 mapRes!34714))))

(declare-fun condMapEmpty!34714 () Bool)

(declare-fun mapDefault!34714 () ValueCell!10425)

(assert (=> b!966930 (= condMapEmpty!34714 (= (arr!28720 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10425)) mapDefault!34714)))))

(declare-fun b!966931 () Bool)

(declare-fun res!647241 () Bool)

(assert (=> b!966931 (=> (not res!647241) (not e!545050))))

(assert (=> b!966931 (= res!647241 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29200 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29200 _keys!1686))))))

(assert (= (and start!82878 res!647240) b!966924))

(assert (= (and b!966924 res!647237) b!966926))

(assert (= (and b!966926 res!647242) b!966929))

(assert (= (and b!966929 res!647235) b!966931))

(assert (= (and b!966931 res!647241) b!966923))

(assert (= (and b!966923 res!647239) b!966922))

(assert (= (and b!966922 res!647236) b!966928))

(assert (= (and b!966928 res!647238) b!966921))

(assert (= (and b!966930 condMapEmpty!34714) mapIsEmpty!34714))

(assert (= (and b!966930 (not condMapEmpty!34714)) mapNonEmpty!34714))

(get-info :version)

(assert (= (and mapNonEmpty!34714 ((_ is ValueCellFull!10425) mapValue!34714)) b!966927))

(assert (= (and b!966930 ((_ is ValueCellFull!10425) mapDefault!34714)) b!966925))

(assert (= start!82878 b!966930))

(declare-fun m!895583 () Bool)

(assert (=> b!966923 m!895583))

(assert (=> b!966923 m!895583))

(declare-fun m!895585 () Bool)

(assert (=> b!966923 m!895585))

(declare-fun m!895587 () Bool)

(assert (=> b!966926 m!895587))

(declare-fun m!895589 () Bool)

(assert (=> b!966921 m!895589))

(assert (=> b!966921 m!895583))

(assert (=> b!966921 m!895589))

(assert (=> b!966921 m!895583))

(declare-fun m!895591 () Bool)

(assert (=> b!966921 m!895591))

(declare-fun m!895593 () Bool)

(assert (=> b!966921 m!895593))

(declare-fun m!895595 () Bool)

(assert (=> start!82878 m!895595))

(declare-fun m!895597 () Bool)

(assert (=> start!82878 m!895597))

(declare-fun m!895599 () Bool)

(assert (=> start!82878 m!895599))

(declare-fun m!895601 () Bool)

(assert (=> b!966929 m!895601))

(declare-fun m!895603 () Bool)

(assert (=> mapNonEmpty!34714 m!895603))

(declare-fun m!895605 () Bool)

(assert (=> b!966922 m!895605))

(assert (=> b!966922 m!895583))

(assert (=> b!966922 m!895605))

(assert (=> b!966922 m!895583))

(declare-fun m!895607 () Bool)

(assert (=> b!966922 m!895607))

(check-sat b_and!30493 (not b!966923) (not mapNonEmpty!34714) (not b!966922) (not b!966929) tp_is_empty!21813 (not b!966921) (not start!82878) (not b!966926) (not b_next!19005))
(check-sat b_and!30493 (not b_next!19005))
