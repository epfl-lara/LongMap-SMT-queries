; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41058 () Bool)

(assert start!41058)

(declare-fun b_free!10971 () Bool)

(declare-fun b_next!10971 () Bool)

(assert (=> start!41058 (= b_free!10971 (not b_next!10971))))

(declare-fun tp!38742 () Bool)

(declare-fun b_and!19149 () Bool)

(assert (=> start!41058 (= tp!38742 b_and!19149)))

(declare-fun b!457773 () Bool)

(declare-fun res!273392 () Bool)

(declare-fun e!267324 () Bool)

(assert (=> b!457773 (=> (not res!273392) (not e!267324))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457773 (= res!273392 (validKeyInArray!0 k0!794))))

(declare-fun b!457774 () Bool)

(declare-fun e!267326 () Bool)

(declare-fun e!267327 () Bool)

(assert (=> b!457774 (= e!267326 e!267327)))

(declare-fun res!273402 () Bool)

(assert (=> b!457774 (=> (not res!273402) (not e!267327))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457774 (= res!273402 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17517 0))(
  ( (V!17518 (val!6199 Int)) )
))
(declare-fun minValue!515 () V!17517)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17517)

(declare-datatypes ((tuple2!8168 0))(
  ( (tuple2!8169 (_1!4095 (_ BitVec 64)) (_2!4095 V!17517)) )
))
(declare-datatypes ((List!8241 0))(
  ( (Nil!8238) (Cons!8237 (h!9093 tuple2!8168) (t!14091 List!8241)) )
))
(declare-datatypes ((ListLongMap!7081 0))(
  ( (ListLongMap!7082 (toList!3556 List!8241)) )
))
(declare-fun lt!207069 () ListLongMap!7081)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!28419 0))(
  ( (array!28420 (arr!13652 (Array (_ BitVec 32) (_ BitVec 64))) (size!14004 (_ BitVec 32))) )
))
(declare-fun lt!207065 () array!28419)

(declare-datatypes ((ValueCell!5811 0))(
  ( (ValueCellFull!5811 (v!8469 V!17517)) (EmptyCell!5811) )
))
(declare-datatypes ((array!28421 0))(
  ( (array!28422 (arr!13653 (Array (_ BitVec 32) ValueCell!5811)) (size!14005 (_ BitVec 32))) )
))
(declare-fun lt!207071 () array!28421)

(declare-fun getCurrentListMapNoExtraKeys!1738 (array!28419 array!28421 (_ BitVec 32) (_ BitVec 32) V!17517 V!17517 (_ BitVec 32) Int) ListLongMap!7081)

(assert (=> b!457774 (= lt!207069 (getCurrentListMapNoExtraKeys!1738 lt!207065 lt!207071 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28421)

(declare-fun v!412 () V!17517)

(assert (=> b!457774 (= lt!207071 (array!28422 (store (arr!13653 _values!549) i!563 (ValueCellFull!5811 v!412)) (size!14005 _values!549)))))

(declare-fun lt!207072 () ListLongMap!7081)

(declare-fun _keys!709 () array!28419)

(assert (=> b!457774 (= lt!207072 (getCurrentListMapNoExtraKeys!1738 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457775 () Bool)

(declare-fun res!273398 () Bool)

(assert (=> b!457775 (=> (not res!273398) (not e!267324))))

(declare-datatypes ((List!8242 0))(
  ( (Nil!8239) (Cons!8238 (h!9094 (_ BitVec 64)) (t!14092 List!8242)) )
))
(declare-fun arrayNoDuplicates!0 (array!28419 (_ BitVec 32) List!8242) Bool)

(assert (=> b!457775 (= res!273398 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8239))))

(declare-fun mapNonEmpty!20107 () Bool)

(declare-fun mapRes!20107 () Bool)

(declare-fun tp!38743 () Bool)

(declare-fun e!267328 () Bool)

(assert (=> mapNonEmpty!20107 (= mapRes!20107 (and tp!38743 e!267328))))

(declare-fun mapKey!20107 () (_ BitVec 32))

(declare-fun mapRest!20107 () (Array (_ BitVec 32) ValueCell!5811))

(declare-fun mapValue!20107 () ValueCell!5811)

(assert (=> mapNonEmpty!20107 (= (arr!13653 _values!549) (store mapRest!20107 mapKey!20107 mapValue!20107))))

(declare-fun b!457776 () Bool)

(declare-fun res!273397 () Bool)

(assert (=> b!457776 (=> (not res!273397) (not e!267326))))

(assert (=> b!457776 (= res!273397 (bvsle from!863 i!563))))

(declare-fun b!457777 () Bool)

(declare-fun res!273396 () Bool)

(assert (=> b!457777 (=> (not res!273396) (not e!267324))))

(declare-fun arrayContainsKey!0 (array!28419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457777 (= res!273396 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20107 () Bool)

(assert (=> mapIsEmpty!20107 mapRes!20107))

(declare-fun b!457779 () Bool)

(declare-fun e!267329 () Bool)

(assert (=> b!457779 (= e!267329 (or (not (= (select (arr!13652 _keys!709) from!863) k0!794)) (bvslt from!863 (size!14004 _keys!709))))))

(declare-fun lt!207067 () ListLongMap!7081)

(declare-fun +!1592 (ListLongMap!7081 tuple2!8168) ListLongMap!7081)

(declare-fun get!6722 (ValueCell!5811 V!17517) V!17517)

(declare-fun dynLambda!882 (Int (_ BitVec 64)) V!17517)

(assert (=> b!457779 (= lt!207069 (+!1592 lt!207067 (tuple2!8169 (select (arr!13652 _keys!709) from!863) (get!6722 (select (arr!13653 _values!549) from!863) (dynLambda!882 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457780 () Bool)

(declare-fun res!273391 () Bool)

(assert (=> b!457780 (=> (not res!273391) (not e!267324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28419 (_ BitVec 32)) Bool)

(assert (=> b!457780 (= res!273391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457781 () Bool)

(declare-fun res!273390 () Bool)

(assert (=> b!457781 (=> (not res!273390) (not e!267324))))

(assert (=> b!457781 (= res!273390 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14004 _keys!709))))))

(declare-fun b!457782 () Bool)

(assert (=> b!457782 (= e!267327 (not e!267329))))

(declare-fun res!273393 () Bool)

(assert (=> b!457782 (=> res!273393 e!267329)))

(assert (=> b!457782 (= res!273393 (not (validKeyInArray!0 (select (arr!13652 _keys!709) from!863))))))

(declare-fun lt!207068 () ListLongMap!7081)

(assert (=> b!457782 (= lt!207068 lt!207067)))

(declare-fun lt!207070 () ListLongMap!7081)

(assert (=> b!457782 (= lt!207067 (+!1592 lt!207070 (tuple2!8169 k0!794 v!412)))))

(assert (=> b!457782 (= lt!207068 (getCurrentListMapNoExtraKeys!1738 lt!207065 lt!207071 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457782 (= lt!207070 (getCurrentListMapNoExtraKeys!1738 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13304 0))(
  ( (Unit!13305) )
))
(declare-fun lt!207066 () Unit!13304)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!751 (array!28419 array!28421 (_ BitVec 32) (_ BitVec 32) V!17517 V!17517 (_ BitVec 32) (_ BitVec 64) V!17517 (_ BitVec 32) Int) Unit!13304)

(assert (=> b!457782 (= lt!207066 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!751 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457783 () Bool)

(declare-fun res!273401 () Bool)

(assert (=> b!457783 (=> (not res!273401) (not e!267326))))

(assert (=> b!457783 (= res!273401 (arrayNoDuplicates!0 lt!207065 #b00000000000000000000000000000000 Nil!8239))))

(declare-fun b!457784 () Bool)

(declare-fun res!273394 () Bool)

(assert (=> b!457784 (=> (not res!273394) (not e!267324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457784 (= res!273394 (validMask!0 mask!1025))))

(declare-fun b!457785 () Bool)

(declare-fun res!273400 () Bool)

(assert (=> b!457785 (=> (not res!273400) (not e!267324))))

(assert (=> b!457785 (= res!273400 (or (= (select (arr!13652 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13652 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457778 () Bool)

(assert (=> b!457778 (= e!267324 e!267326)))

(declare-fun res!273389 () Bool)

(assert (=> b!457778 (=> (not res!273389) (not e!267326))))

(assert (=> b!457778 (= res!273389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207065 mask!1025))))

(assert (=> b!457778 (= lt!207065 (array!28420 (store (arr!13652 _keys!709) i!563 k0!794) (size!14004 _keys!709)))))

(declare-fun res!273399 () Bool)

(assert (=> start!41058 (=> (not res!273399) (not e!267324))))

(assert (=> start!41058 (= res!273399 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14004 _keys!709))))))

(assert (=> start!41058 e!267324))

(declare-fun tp_is_empty!12309 () Bool)

(assert (=> start!41058 tp_is_empty!12309))

(assert (=> start!41058 tp!38742))

(assert (=> start!41058 true))

(declare-fun e!267325 () Bool)

(declare-fun array_inv!9886 (array!28421) Bool)

(assert (=> start!41058 (and (array_inv!9886 _values!549) e!267325)))

(declare-fun array_inv!9887 (array!28419) Bool)

(assert (=> start!41058 (array_inv!9887 _keys!709)))

(declare-fun b!457786 () Bool)

(declare-fun e!267330 () Bool)

(assert (=> b!457786 (= e!267330 tp_is_empty!12309)))

(declare-fun b!457787 () Bool)

(assert (=> b!457787 (= e!267325 (and e!267330 mapRes!20107))))

(declare-fun condMapEmpty!20107 () Bool)

(declare-fun mapDefault!20107 () ValueCell!5811)

(assert (=> b!457787 (= condMapEmpty!20107 (= (arr!13653 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5811)) mapDefault!20107)))))

(declare-fun b!457788 () Bool)

(declare-fun res!273395 () Bool)

(assert (=> b!457788 (=> (not res!273395) (not e!267324))))

(assert (=> b!457788 (= res!273395 (and (= (size!14005 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14004 _keys!709) (size!14005 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457789 () Bool)

(assert (=> b!457789 (= e!267328 tp_is_empty!12309)))

(assert (= (and start!41058 res!273399) b!457784))

(assert (= (and b!457784 res!273394) b!457788))

(assert (= (and b!457788 res!273395) b!457780))

(assert (= (and b!457780 res!273391) b!457775))

(assert (= (and b!457775 res!273398) b!457781))

(assert (= (and b!457781 res!273390) b!457773))

(assert (= (and b!457773 res!273392) b!457785))

(assert (= (and b!457785 res!273400) b!457777))

(assert (= (and b!457777 res!273396) b!457778))

(assert (= (and b!457778 res!273389) b!457783))

(assert (= (and b!457783 res!273401) b!457776))

(assert (= (and b!457776 res!273397) b!457774))

(assert (= (and b!457774 res!273402) b!457782))

(assert (= (and b!457782 (not res!273393)) b!457779))

(assert (= (and b!457787 condMapEmpty!20107) mapIsEmpty!20107))

(assert (= (and b!457787 (not condMapEmpty!20107)) mapNonEmpty!20107))

(get-info :version)

(assert (= (and mapNonEmpty!20107 ((_ is ValueCellFull!5811) mapValue!20107)) b!457789))

(assert (= (and b!457787 ((_ is ValueCellFull!5811) mapDefault!20107)) b!457786))

(assert (= start!41058 b!457787))

(declare-fun b_lambda!9737 () Bool)

(assert (=> (not b_lambda!9737) (not b!457779)))

(declare-fun t!14090 () Bool)

(declare-fun tb!3807 () Bool)

(assert (=> (and start!41058 (= defaultEntry!557 defaultEntry!557) t!14090) tb!3807))

(declare-fun result!7155 () Bool)

(assert (=> tb!3807 (= result!7155 tp_is_empty!12309)))

(assert (=> b!457779 t!14090))

(declare-fun b_and!19151 () Bool)

(assert (= b_and!19149 (and (=> t!14090 result!7155) b_and!19151)))

(declare-fun m!441111 () Bool)

(assert (=> b!457777 m!441111))

(declare-fun m!441113 () Bool)

(assert (=> b!457774 m!441113))

(declare-fun m!441115 () Bool)

(assert (=> b!457774 m!441115))

(declare-fun m!441117 () Bool)

(assert (=> b!457774 m!441117))

(declare-fun m!441119 () Bool)

(assert (=> b!457779 m!441119))

(declare-fun m!441121 () Bool)

(assert (=> b!457779 m!441121))

(declare-fun m!441123 () Bool)

(assert (=> b!457779 m!441123))

(declare-fun m!441125 () Bool)

(assert (=> b!457779 m!441125))

(assert (=> b!457779 m!441123))

(assert (=> b!457779 m!441121))

(declare-fun m!441127 () Bool)

(assert (=> b!457779 m!441127))

(declare-fun m!441129 () Bool)

(assert (=> mapNonEmpty!20107 m!441129))

(declare-fun m!441131 () Bool)

(assert (=> b!457784 m!441131))

(declare-fun m!441133 () Bool)

(assert (=> start!41058 m!441133))

(declare-fun m!441135 () Bool)

(assert (=> start!41058 m!441135))

(declare-fun m!441137 () Bool)

(assert (=> b!457773 m!441137))

(declare-fun m!441139 () Bool)

(assert (=> b!457778 m!441139))

(declare-fun m!441141 () Bool)

(assert (=> b!457778 m!441141))

(declare-fun m!441143 () Bool)

(assert (=> b!457780 m!441143))

(assert (=> b!457782 m!441119))

(declare-fun m!441145 () Bool)

(assert (=> b!457782 m!441145))

(declare-fun m!441147 () Bool)

(assert (=> b!457782 m!441147))

(declare-fun m!441149 () Bool)

(assert (=> b!457782 m!441149))

(assert (=> b!457782 m!441119))

(declare-fun m!441151 () Bool)

(assert (=> b!457782 m!441151))

(declare-fun m!441153 () Bool)

(assert (=> b!457782 m!441153))

(declare-fun m!441155 () Bool)

(assert (=> b!457785 m!441155))

(declare-fun m!441157 () Bool)

(assert (=> b!457775 m!441157))

(declare-fun m!441159 () Bool)

(assert (=> b!457783 m!441159))

(check-sat b_and!19151 (not b_next!10971) (not b!457773) (not mapNonEmpty!20107) (not b!457777) (not b!457782) (not start!41058) (not b!457783) (not b!457779) tp_is_empty!12309 (not b!457778) (not b_lambda!9737) (not b!457775) (not b!457780) (not b!457784) (not b!457774))
(check-sat b_and!19151 (not b_next!10971))
