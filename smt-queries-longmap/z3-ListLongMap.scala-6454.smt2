; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82566 () Bool)

(assert start!82566)

(declare-fun b_free!18699 () Bool)

(declare-fun b_next!18699 () Bool)

(assert (=> start!82566 (= b_free!18699 (not b_next!18699))))

(declare-fun tp!65216 () Bool)

(declare-fun b_and!30187 () Bool)

(assert (=> start!82566 (= tp!65216 b_and!30187)))

(declare-fun b!962222 () Bool)

(declare-fun res!643942 () Bool)

(declare-fun e!542630 () Bool)

(assert (=> b!962222 (=> (not res!643942) (not e!542630))))

(declare-datatypes ((array!59099 0))(
  ( (array!59100 (arr!28418 (Array (_ BitVec 32) (_ BitVec 64))) (size!28897 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59099)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962222 (= res!643942 (validKeyInArray!0 (select (arr!28418 _keys!1686) i!803)))))

(declare-fun b!962223 () Bool)

(declare-fun res!643945 () Bool)

(assert (=> b!962223 (=> (not res!643945) (not e!542630))))

(declare-datatypes ((List!19722 0))(
  ( (Nil!19719) (Cons!19718 (h!20880 (_ BitVec 64)) (t!28085 List!19722)) )
))
(declare-fun arrayNoDuplicates!0 (array!59099 (_ BitVec 32) List!19722) Bool)

(assert (=> b!962223 (= res!643945 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19719))))

(declare-fun b!962224 () Bool)

(declare-fun res!643941 () Bool)

(assert (=> b!962224 (=> (not res!643941) (not e!542630))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!962224 (= res!643941 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28897 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28897 _keys!1686))))))

(declare-fun mapNonEmpty!34246 () Bool)

(declare-fun mapRes!34246 () Bool)

(declare-fun tp!65217 () Bool)

(declare-fun e!542627 () Bool)

(assert (=> mapNonEmpty!34246 (= mapRes!34246 (and tp!65217 e!542627))))

(declare-datatypes ((V!33651 0))(
  ( (V!33652 (val!10801 Int)) )
))
(declare-datatypes ((ValueCell!10269 0))(
  ( (ValueCellFull!10269 (v!13359 V!33651)) (EmptyCell!10269) )
))
(declare-fun mapValue!34246 () ValueCell!10269)

(declare-fun mapRest!34246 () (Array (_ BitVec 32) ValueCell!10269))

(declare-datatypes ((array!59101 0))(
  ( (array!59102 (arr!28419 (Array (_ BitVec 32) ValueCell!10269)) (size!28898 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59101)

(declare-fun mapKey!34246 () (_ BitVec 32))

(assert (=> mapNonEmpty!34246 (= (arr!28419 _values!1400) (store mapRest!34246 mapKey!34246 mapValue!34246))))

(declare-fun b!962225 () Bool)

(declare-fun res!643944 () Bool)

(assert (=> b!962225 (=> (not res!643944) (not e!542630))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962225 (= res!643944 (and (= (size!28898 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28897 _keys!1686) (size!28898 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962226 () Bool)

(declare-fun res!643943 () Bool)

(assert (=> b!962226 (=> (not res!643943) (not e!542630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59099 (_ BitVec 32)) Bool)

(assert (=> b!962226 (= res!643943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962227 () Bool)

(declare-fun tp_is_empty!21501 () Bool)

(assert (=> b!962227 (= e!542627 tp_is_empty!21501)))

(declare-fun res!643940 () Bool)

(assert (=> start!82566 (=> (not res!643940) (not e!542630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82566 (= res!643940 (validMask!0 mask!2110))))

(assert (=> start!82566 e!542630))

(assert (=> start!82566 true))

(declare-fun e!542628 () Bool)

(declare-fun array_inv!22021 (array!59101) Bool)

(assert (=> start!82566 (and (array_inv!22021 _values!1400) e!542628)))

(declare-fun array_inv!22022 (array!59099) Bool)

(assert (=> start!82566 (array_inv!22022 _keys!1686)))

(assert (=> start!82566 tp!65216))

(assert (=> start!82566 tp_is_empty!21501))

(declare-fun b!962228 () Bool)

(declare-fun e!542626 () Bool)

(assert (=> b!962228 (= e!542626 tp_is_empty!21501)))

(declare-fun b!962229 () Bool)

(assert (=> b!962229 (= e!542630 false)))

(declare-fun minValue!1342 () V!33651)

(declare-fun lt!430852 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33651)

(declare-datatypes ((tuple2!13872 0))(
  ( (tuple2!13873 (_1!6947 (_ BitVec 64)) (_2!6947 V!33651)) )
))
(declare-datatypes ((List!19723 0))(
  ( (Nil!19720) (Cons!19719 (h!20881 tuple2!13872) (t!28086 List!19723)) )
))
(declare-datatypes ((ListLongMap!12569 0))(
  ( (ListLongMap!12570 (toList!6300 List!19723)) )
))
(declare-fun contains!5403 (ListLongMap!12569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3533 (array!59099 array!59101 (_ BitVec 32) (_ BitVec 32) V!33651 V!33651 (_ BitVec 32) Int) ListLongMap!12569)

(assert (=> b!962229 (= lt!430852 (contains!5403 (getCurrentListMap!3533 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28418 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34246 () Bool)

(assert (=> mapIsEmpty!34246 mapRes!34246))

(declare-fun b!962230 () Bool)

(assert (=> b!962230 (= e!542628 (and e!542626 mapRes!34246))))

(declare-fun condMapEmpty!34246 () Bool)

(declare-fun mapDefault!34246 () ValueCell!10269)

(assert (=> b!962230 (= condMapEmpty!34246 (= (arr!28419 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10269)) mapDefault!34246)))))

(assert (= (and start!82566 res!643940) b!962225))

(assert (= (and b!962225 res!643944) b!962226))

(assert (= (and b!962226 res!643943) b!962223))

(assert (= (and b!962223 res!643945) b!962224))

(assert (= (and b!962224 res!643941) b!962222))

(assert (= (and b!962222 res!643942) b!962229))

(assert (= (and b!962230 condMapEmpty!34246) mapIsEmpty!34246))

(assert (= (and b!962230 (not condMapEmpty!34246)) mapNonEmpty!34246))

(get-info :version)

(assert (= (and mapNonEmpty!34246 ((_ is ValueCellFull!10269) mapValue!34246)) b!962227))

(assert (= (and b!962230 ((_ is ValueCellFull!10269) mapDefault!34246)) b!962228))

(assert (= start!82566 b!962230))

(declare-fun m!891929 () Bool)

(assert (=> mapNonEmpty!34246 m!891929))

(declare-fun m!891931 () Bool)

(assert (=> b!962222 m!891931))

(assert (=> b!962222 m!891931))

(declare-fun m!891933 () Bool)

(assert (=> b!962222 m!891933))

(declare-fun m!891935 () Bool)

(assert (=> b!962223 m!891935))

(declare-fun m!891937 () Bool)

(assert (=> start!82566 m!891937))

(declare-fun m!891939 () Bool)

(assert (=> start!82566 m!891939))

(declare-fun m!891941 () Bool)

(assert (=> start!82566 m!891941))

(declare-fun m!891943 () Bool)

(assert (=> b!962229 m!891943))

(assert (=> b!962229 m!891931))

(assert (=> b!962229 m!891943))

(assert (=> b!962229 m!891931))

(declare-fun m!891945 () Bool)

(assert (=> b!962229 m!891945))

(declare-fun m!891947 () Bool)

(assert (=> b!962226 m!891947))

(check-sat (not b!962223) (not b!962229) (not start!82566) (not b_next!18699) b_and!30187 (not b!962222) tp_is_empty!21501 (not mapNonEmpty!34246) (not b!962226))
(check-sat b_and!30187 (not b_next!18699))
