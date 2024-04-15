; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40954 () Bool)

(assert start!40954)

(declare-fun b_free!10903 () Bool)

(declare-fun b_next!10903 () Bool)

(assert (=> start!40954 (= b_free!10903 (not b_next!10903))))

(declare-fun tp!38536 () Bool)

(declare-fun b_and!19019 () Bool)

(assert (=> start!40954 (= tp!38536 b_and!19019)))

(declare-fun b!455671 () Bool)

(declare-fun res!271842 () Bool)

(declare-fun e!266309 () Bool)

(assert (=> b!455671 (=> (not res!271842) (not e!266309))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455671 (= res!271842 (validMask!0 mask!1025))))

(declare-fun b!455672 () Bool)

(declare-fun res!271839 () Bool)

(declare-fun e!266311 () Bool)

(assert (=> b!455672 (=> (not res!271839) (not e!266311))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455672 (= res!271839 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20002 () Bool)

(declare-fun mapRes!20002 () Bool)

(assert (=> mapIsEmpty!20002 mapRes!20002))

(declare-fun b!455673 () Bool)

(declare-fun res!271843 () Bool)

(assert (=> b!455673 (=> (not res!271843) (not e!266309))))

(declare-datatypes ((array!28277 0))(
  ( (array!28278 (arr!13582 (Array (_ BitVec 32) (_ BitVec 64))) (size!13935 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28277)

(assert (=> b!455673 (= res!271843 (or (= (select (arr!13582 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13582 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455674 () Bool)

(declare-fun res!271848 () Bool)

(assert (=> b!455674 (=> (not res!271848) (not e!266311))))

(declare-fun lt!206204 () array!28277)

(declare-datatypes ((List!8200 0))(
  ( (Nil!8197) (Cons!8196 (h!9052 (_ BitVec 64)) (t!14019 List!8200)) )
))
(declare-fun arrayNoDuplicates!0 (array!28277 (_ BitVec 32) List!8200) Bool)

(assert (=> b!455674 (= res!271848 (arrayNoDuplicates!0 lt!206204 #b00000000000000000000000000000000 Nil!8197))))

(declare-fun b!455675 () Bool)

(declare-fun res!271845 () Bool)

(assert (=> b!455675 (=> (not res!271845) (not e!266309))))

(assert (=> b!455675 (= res!271845 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8197))))

(declare-fun mapNonEmpty!20002 () Bool)

(declare-fun tp!38535 () Bool)

(declare-fun e!266308 () Bool)

(assert (=> mapNonEmpty!20002 (= mapRes!20002 (and tp!38535 e!266308))))

(declare-datatypes ((V!17427 0))(
  ( (V!17428 (val!6165 Int)) )
))
(declare-datatypes ((ValueCell!5777 0))(
  ( (ValueCellFull!5777 (v!8425 V!17427)) (EmptyCell!5777) )
))
(declare-fun mapValue!20002 () ValueCell!5777)

(declare-fun mapKey!20002 () (_ BitVec 32))

(declare-datatypes ((array!28279 0))(
  ( (array!28280 (arr!13583 (Array (_ BitVec 32) ValueCell!5777)) (size!13936 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28279)

(declare-fun mapRest!20002 () (Array (_ BitVec 32) ValueCell!5777))

(assert (=> mapNonEmpty!20002 (= (arr!13583 _values!549) (store mapRest!20002 mapKey!20002 mapValue!20002))))

(declare-fun b!455677 () Bool)

(assert (=> b!455677 (= e!266311 false)))

(declare-fun minValue!515 () V!17427)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun v!412 () V!17427)

(declare-datatypes ((tuple2!8138 0))(
  ( (tuple2!8139 (_1!4080 (_ BitVec 64)) (_2!4080 V!17427)) )
))
(declare-datatypes ((List!8201 0))(
  ( (Nil!8198) (Cons!8197 (h!9053 tuple2!8138) (t!14020 List!8201)) )
))
(declare-datatypes ((ListLongMap!7041 0))(
  ( (ListLongMap!7042 (toList!3536 List!8201)) )
))
(declare-fun lt!206203 () ListLongMap!7041)

(declare-fun zeroValue!515 () V!17427)

(declare-fun getCurrentListMapNoExtraKeys!1731 (array!28277 array!28279 (_ BitVec 32) (_ BitVec 32) V!17427 V!17427 (_ BitVec 32) Int) ListLongMap!7041)

(assert (=> b!455677 (= lt!206203 (getCurrentListMapNoExtraKeys!1731 lt!206204 (array!28280 (store (arr!13583 _values!549) i!563 (ValueCellFull!5777 v!412)) (size!13936 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206202 () ListLongMap!7041)

(assert (=> b!455677 (= lt!206202 (getCurrentListMapNoExtraKeys!1731 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455678 () Bool)

(declare-fun res!271846 () Bool)

(assert (=> b!455678 (=> (not res!271846) (not e!266309))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455678 (= res!271846 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455679 () Bool)

(declare-fun res!271847 () Bool)

(assert (=> b!455679 (=> (not res!271847) (not e!266309))))

(assert (=> b!455679 (= res!271847 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13935 _keys!709))))))

(declare-fun b!455680 () Bool)

(declare-fun res!271844 () Bool)

(assert (=> b!455680 (=> (not res!271844) (not e!266309))))

(assert (=> b!455680 (= res!271844 (and (= (size!13936 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13935 _keys!709) (size!13936 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455681 () Bool)

(declare-fun e!266310 () Bool)

(declare-fun e!266306 () Bool)

(assert (=> b!455681 (= e!266310 (and e!266306 mapRes!20002))))

(declare-fun condMapEmpty!20002 () Bool)

(declare-fun mapDefault!20002 () ValueCell!5777)

(assert (=> b!455681 (= condMapEmpty!20002 (= (arr!13583 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5777)) mapDefault!20002)))))

(declare-fun b!455682 () Bool)

(declare-fun tp_is_empty!12241 () Bool)

(assert (=> b!455682 (= e!266306 tp_is_empty!12241)))

(declare-fun b!455683 () Bool)

(declare-fun res!271850 () Bool)

(assert (=> b!455683 (=> (not res!271850) (not e!266309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455683 (= res!271850 (validKeyInArray!0 k0!794))))

(declare-fun b!455684 () Bool)

(assert (=> b!455684 (= e!266308 tp_is_empty!12241)))

(declare-fun b!455685 () Bool)

(assert (=> b!455685 (= e!266309 e!266311)))

(declare-fun res!271840 () Bool)

(assert (=> b!455685 (=> (not res!271840) (not e!266311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28277 (_ BitVec 32)) Bool)

(assert (=> b!455685 (= res!271840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206204 mask!1025))))

(assert (=> b!455685 (= lt!206204 (array!28278 (store (arr!13582 _keys!709) i!563 k0!794) (size!13935 _keys!709)))))

(declare-fun b!455676 () Bool)

(declare-fun res!271841 () Bool)

(assert (=> b!455676 (=> (not res!271841) (not e!266309))))

(assert (=> b!455676 (= res!271841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!271849 () Bool)

(assert (=> start!40954 (=> (not res!271849) (not e!266309))))

(assert (=> start!40954 (= res!271849 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13935 _keys!709))))))

(assert (=> start!40954 e!266309))

(assert (=> start!40954 tp_is_empty!12241))

(assert (=> start!40954 tp!38536))

(assert (=> start!40954 true))

(declare-fun array_inv!9900 (array!28279) Bool)

(assert (=> start!40954 (and (array_inv!9900 _values!549) e!266310)))

(declare-fun array_inv!9901 (array!28277) Bool)

(assert (=> start!40954 (array_inv!9901 _keys!709)))

(assert (= (and start!40954 res!271849) b!455671))

(assert (= (and b!455671 res!271842) b!455680))

(assert (= (and b!455680 res!271844) b!455676))

(assert (= (and b!455676 res!271841) b!455675))

(assert (= (and b!455675 res!271845) b!455679))

(assert (= (and b!455679 res!271847) b!455683))

(assert (= (and b!455683 res!271850) b!455673))

(assert (= (and b!455673 res!271843) b!455678))

(assert (= (and b!455678 res!271846) b!455685))

(assert (= (and b!455685 res!271840) b!455674))

(assert (= (and b!455674 res!271848) b!455672))

(assert (= (and b!455672 res!271839) b!455677))

(assert (= (and b!455681 condMapEmpty!20002) mapIsEmpty!20002))

(assert (= (and b!455681 (not condMapEmpty!20002)) mapNonEmpty!20002))

(get-info :version)

(assert (= (and mapNonEmpty!20002 ((_ is ValueCellFull!5777) mapValue!20002)) b!455684))

(assert (= (and b!455681 ((_ is ValueCellFull!5777) mapDefault!20002)) b!455682))

(assert (= start!40954 b!455681))

(declare-fun m!438827 () Bool)

(assert (=> b!455678 m!438827))

(declare-fun m!438829 () Bool)

(assert (=> mapNonEmpty!20002 m!438829))

(declare-fun m!438831 () Bool)

(assert (=> b!455675 m!438831))

(declare-fun m!438833 () Bool)

(assert (=> b!455683 m!438833))

(declare-fun m!438835 () Bool)

(assert (=> start!40954 m!438835))

(declare-fun m!438837 () Bool)

(assert (=> start!40954 m!438837))

(declare-fun m!438839 () Bool)

(assert (=> b!455677 m!438839))

(declare-fun m!438841 () Bool)

(assert (=> b!455677 m!438841))

(declare-fun m!438843 () Bool)

(assert (=> b!455677 m!438843))

(declare-fun m!438845 () Bool)

(assert (=> b!455673 m!438845))

(declare-fun m!438847 () Bool)

(assert (=> b!455676 m!438847))

(declare-fun m!438849 () Bool)

(assert (=> b!455674 m!438849))

(declare-fun m!438851 () Bool)

(assert (=> b!455685 m!438851))

(declare-fun m!438853 () Bool)

(assert (=> b!455685 m!438853))

(declare-fun m!438855 () Bool)

(assert (=> b!455671 m!438855))

(check-sat (not b!455683) (not b!455677) (not b!455678) b_and!19019 (not start!40954) (not b!455675) (not b!455685) tp_is_empty!12241 (not mapNonEmpty!20002) (not b!455676) (not b!455671) (not b_next!10903) (not b!455674))
(check-sat b_and!19019 (not b_next!10903))
